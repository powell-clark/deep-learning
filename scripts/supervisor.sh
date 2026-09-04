#!/usr/bin/env bash
# Deterministic supervisor for the autonomous curriculum build. Cron every 15 min.
#
# Costs nothing when idle. Starts Sonnet seats only while work remains AND the machine
# has headroom — the operator's workstation runs their own sessions alongside this, so
# a seat is never started into a loaded box.
#
# It deliberately does NOT edit the crontab. A failed `crontab -l` in a pipeline can wipe
# unrelated entries; instead the terminal condition drops a sentinel and every later run
# exits immediately. Remove the cron line by hand once CORPUS-READY appears.
set -uo pipefail

REPO="/home/powell-clark/projects/auxiliary/deep-learning"
LOG="$REPO/.dl-supervisor.log"
SENTINEL="$REPO/.dl-complete"
LOCK="/tmp/dl-supervisor.lock"

MAX_BUILDERS=1         # one builder at a time: memory safety beats wall clock
MIN_FREE_GB=6          # available RAM floor; memory exhaustion is what kills a box
MAX_LOAD=24            # 1-min load ceiling (16 cores; this machine idles near 13)
MAX_SWAPIN_KBPS=512    # refuse while the box is actively thrashing

exec 9>"$LOCK"
flock -n 9 || exit 0
cd "$REPO" || exit 0

note() { printf '%s %s %s\n' "$(date -Iseconds)" "$1" "$2" >> "$LOG"; }

[ -f "$SENTINEL" ] && exit 0

git pull --rebase --autostash -q 2>/dev/null || note pull-failed "continuing on local state"

backlog=$(( $(wc -l < CONSCIOUSNESS/tasks/TASK-BACKLOG-INDEX.md) - 1 ))
active=$(( $(wc -l < CONSCIOUSNESS/tasks/TASK-ACTIVE-INDEX.md) - 1 ))
[ "$backlog" -lt 0 ] && backlog=0
[ "$active" -lt 0 ] && active=0
remaining=$(( backlog + active ))

MK="$HOME/.claude/plugins/marketplaces/powell-clark/adapters/claude-code/dist/packages/core"
awaiting=0
if [ -f "$MK/review/sweep-cli.js" ]; then
  awaiting=$(node "$MK/review/sweep-cli.js" --json 2>/dev/null \
    | python3 -c 'import sys,json
try:
    d=json.load(sys.stdin); print(len(d.get("rows",[])))
except Exception: print(0)' 2>/dev/null || echo 0)
fi

seats() { claude agents --json 2>/dev/null | python3 -c "import sys,json
try:
    a=json.load(sys.stdin)
    print(sum(1 for s in a if s.get('state')=='running' and '$1' in (s.get('name') or '')))
except Exception: print(0)" 2>/dev/null || echo 0; }

live_builders=$(seats dl-builder)
live_reviewer=$(seats dl-reviewer)

free_gb=$(free -g | awk '/^Mem:/{print $7}')
load1=$(awk '{printf "%d", $1}' /proc/loadavg)
# Sample swap-in over one second; a thrashing box must not be given more work.
swapin=$(vmstat 1 2 | tail -1 | awk '{print $7}')
[ -z "$swapin" ] && swapin=0

# Terminal condition: nothing to build, nothing to judge, nothing in flight.
if [ "$remaining" -eq 0 ] && [ "$awaiting" -eq 0 ] \
   && [ "$live_builders" -eq 0 ] && [ "$live_reviewer" -eq 0 ]; then
  note corpus-ready "all tasks done, no verdicts awaiting — remove the cron line by hand"
  touch "$SENTINEL"
  exit 0
fi

if [ "$free_gb" -lt "$MIN_FREE_GB" ] || [ "$load1" -gt "$MAX_LOAD" ] \
   || [ "$swapin" -gt "$MAX_SWAPIN_KBPS" ]; then
  note throttled "free=${free_gb}GB load=${load1} swapin=${swapin}KB/s remaining=${remaining} awaiting=${awaiting} — no seat this cycle"
  exit 0
fi

start_seat() {
  ( cd "$REPO" && claude --bg --name "$1" --model sonnet --effort high \
      --permission-mode bypassPermissions "$2" ) >/dev/null 2>&1
  note seat-started "$1 sonnet/high free=${free_gb}GB load=${load1} swapin=${swapin}KB/s"
}

# Reviewer first: it unblocks features and is short-lived.
if [ "$awaiting" -gt 0 ] && [ "$live_reviewer" -eq 0 ]; then
  start_seat "dl-reviewer-$(date +%H%M%S)" \
    "Read REVIEWER.md in this repository and follow it exactly. You are the reviewer; do not write notebooks."
  exit 0
fi

if [ "$remaining" -gt 0 ] && [ "$live_builders" -lt "$MAX_BUILDERS" ]; then
  start_seat "dl-builder-$(date +%H%M%S)" "/consciousness:on"
fi
