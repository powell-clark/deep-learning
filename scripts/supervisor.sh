#!/usr/bin/env bash
# Deterministic supervisor for the autonomous curriculum build. Cron every 15 min.
# Costs nothing when idle; starts Sonnet seats only while work remains AND the
# machine has headroom. Never starts a seat that would push the box into swap.
set -uo pipefail
REPO="/home/powell-clark/projects/auxiliary/deep-learning"
LOG="$REPO/CONSCIOUSNESS/stream/dispatch-log.jsonl"
LOCK="/tmp/dl-supervisor.lock"
MAX_BUILDERS=2
MIN_FREE_GB=6          # refuse to start a seat below this available memory
MAX_LOAD=12            # refuse to start a seat above this 1-min load average

exec 9>"$LOCK"
flock -n 9 || exit 0

cd "$REPO" || exit 0
ts() { date -Iseconds; }
note() { printf '{"ts":"%s","event":"%s","detail":"%s"}\n' "$(ts)" "$1" "$2" >> "$LOG"; }

git pull --rebase --autostash -q 2>/dev/null || note pull-failed "rebase pull failed; continuing"

backlog=$(( $(wc -l < CONSCIOUSNESS/tasks/TASK-BACKLOG-INDEX.md) - 1 ))
active=$(( $(wc -l < CONSCIOUSNESS/tasks/TASK-ACTIVE-INDEX.md) - 1 ))
[ "$backlog" -lt 0 ] && backlog=0
[ "$active" -lt 0 ] && active=0
remaining=$(( backlog + active ))

MK=~/.claude/plugins/marketplaces/powell-clark/adapters/claude-code/dist/packages/core
awaiting=0
if [ -f "$MK/review/sweep-cli.js" ]; then
  awaiting=$(node "$MK/review/sweep-cli.js" --json 2>/dev/null \
    | python3 -c 'import sys,json; d=json.load(sys.stdin); print(len(d.get("agent",d) if isinstance(d,dict) else d))' 2>/dev/null || echo 0)
fi

live_builders=$(claude agents --json 2>/dev/null \
  | python3 -c 'import sys,json; a=json.load(sys.stdin); print(sum(1 for s in a if s.get("state")=="running" and "dl-builder" in (s.get("name") or "")))' 2>/dev/null || echo 0)
live_reviewer=$(claude agents --json 2>/dev/null \
  | python3 -c 'import sys,json; a=json.load(sys.stdin); print(sum(1 for s in a if s.get("state")=="running" and "dl-reviewer" in (s.get("name") or "")))' 2>/dev/null || echo 0)

free_gb=$(free -g | awk '/^Mem:/{print $7}')
load1=$(awk '{printf "%d", $1}' /proc/loadavg)

# Terminal condition: nothing left to build and nothing left to judge.
if [ "$remaining" -eq 0 ] && [ "$awaiting" -eq 0 ] && [ "$live_builders" -eq 0 ] && [ "$live_reviewer" -eq 0 ]; then
  note corpus-ready "no tasks remaining, no verdicts awaiting"
  crontab -l 2>/dev/null | grep -v 'dl-supervisor\|deep-learning/scripts/supervisor.sh' | crontab -
  note supervisor-retired "cron entry removed"
  exit 0
fi

if [ "$free_gb" -lt "$MIN_FREE_GB" ] || [ "$load1" -gt "$MAX_LOAD" ]; then
  note throttled "free=${free_gb}GB load=${load1} — not starting seats this cycle"
  exit 0
fi

start_seat() {
  local name="$1" prompt="$2"
  ( cd "$REPO" && claude --bg --name "$name" --model sonnet --effort high \
      --permission-mode bypassPermissions "$prompt" ) >/dev/null 2>&1
  note seat-started "$name (sonnet/high) free=${free_gb}GB load=${load1}"
}

if [ "$remaining" -gt 0 ] && [ "$live_builders" -lt "$MAX_BUILDERS" ]; then
  start_seat "dl-builder-$(date +%s)" "/consciousness:on"
fi

if [ "$awaiting" -gt 0 ] && [ "$live_reviewer" -eq 0 ]; then
  start_seat "dl-reviewer-$(date +%s)" "Read REVIEWER.md in this repository and follow it exactly. Do not write notebooks; you are the reviewer."
fi
