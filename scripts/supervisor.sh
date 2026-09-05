#!/usr/bin/env bash
# Deterministic supervisor for the autonomous curriculum build. Cron every 15 min.
#
# Costs nothing when idle. Starts Sonnet seats only while work remains AND the machine
# has headroom — the operator's workstation runs their own sessions alongside this, so
# a seat is never started into a loaded box.
#
# HARDENED after the first unattended night (2026-09-05). The original logged one line
# at 00:30 and then nothing across six cron ticks. Cause: cron gives a minimal PATH and
# no SSH agent or tty, so an external call could block forever while holding the flock;
# every later tick then exited silently at `flock -n`. Three rules now prevent that class:
#   1. every external command is wrapped in `timeout` — nothing can hang indefinitely
#   2. PATH is set explicitly; cron's default cannot see node, claude or python3
#   3. a heartbeat is logged at entry, so silence is always diagnosable
set -uo pipefail

# 2. cron's PATH is /usr/bin:/bin — none of the tools this needs are on it.
export PATH="$HOME/.nvm/versions/node/v22.23.1/bin:$HOME/.local/bin:$HOME/.local/share/pnpm:/usr/local/bin:/usr/bin:/bin"
# git must never wait for credentials it cannot obtain from cron.
export GIT_TERMINAL_PROMPT=0
export GIT_SSH_COMMAND="ssh -o BatchMode=yes -o ConnectTimeout=10 -o StrictHostKeyChecking=accept-new"

REPO="/home/powell-clark/projects/auxiliary/deep-learning"
LOG="$REPO/.dl-supervisor.log"
SENTINEL="$REPO/.dl-complete"
LOCK="/tmp/dl-supervisor.lock"

MAX_BUILDERS=1         # one builder at a time: memory safety beats wall clock
MIN_FREE_GB=6          # available RAM floor; memory exhaustion is what kills a box
MAX_LOAD=24            # 1-min load ceiling (16 cores)
MAX_SWAPIN_KBPS=2048   # secondary signal; the RAM floor above is the real crash guard

exec 9>"$LOCK"
flock -n 9 || exit 0
cd "$REPO" || exit 0

note() { printf '%s %s %s\n' "$(date -Iseconds)" "$1" "$2" >> "$LOG"; }

[ -f "$SENTINEL" ] && exit 0

# 3. Heartbeat first: if the script dies later, the log still proves it ran.
note tick "supervisor entered"

timeout 60 git pull --rebase --autostash -q 2>/dev/null || note pull-skipped "pull failed or timed out; continuing on local state"

backlog=$(( $(wc -l < CONSCIOUSNESS/tasks/TASK-BACKLOG-INDEX.md) - 1 ))
active=$(( $(wc -l < CONSCIOUSNESS/tasks/TASK-ACTIVE-INDEX.md) - 1 ))
[ "$backlog" -lt 0 ] && backlog=0
[ "$active" -lt 0 ] && active=0
remaining=$(( backlog + active ))

MK="$HOME/.claude/plugins/marketplaces/powell-clark/adapters/claude-code/dist/packages/core"
awaiting=0
if [ -f "$MK/review/sweep-cli.js" ]; then
  awaiting=$(timeout 60 node "$MK/review/sweep-cli.js" --json 2>/dev/null \
    | timeout 20 python3 -c 'import sys,json
try:
    d=json.load(sys.stdin); print(len(d.get("rows",[])))
except Exception: print(0)' 2>/dev/null || echo 0)
fi
[ -z "${awaiting:-}" ] && awaiting=0

# Count LIVE seats. The harness reports a working background session as state
# 'working', not 'running' — matching 'running' made this return 0 always, so
# MAX_BUILDERS never bound and the 02:15 tick started a second builder while the
# first was still going. Counting by exclusion from the terminal states is robust
# to further state names being added.
TERMINAL_STATES="done failed killed stopped cancelled error"
seats() { timeout 60 claude agents --json 2>/dev/null | timeout 20 python3 -c "import sys,json
TERMINAL={'done','failed','killed','stopped','cancelled','error'}
try:
    a=json.load(sys.stdin)
    print(sum(1 for s in a
              if (s.get('state') or '') not in TERMINAL
              and '$1' in (s.get('name') or '')))
except Exception: print(0)" 2>/dev/null || echo 0; }

# Fail SAFE: an uncountable seat census means "assume busy", never "assume idle".
live_builders=$(seats dl-builder); [ -z "${live_builders:-}" ] && live_builders="$MAX_BUILDERS"
live_reviewer=$(seats dl-reviewer); [ -z "${live_reviewer:-}" ] && live_reviewer=1

free_gb=$(free -g | awk '/^Mem:/{print $7}')
load1=$(awk '{printf "%d", $1}' /proc/loadavg)
swapin=$(timeout 15 vmstat 1 2 | tail -1 | awk '{print $7}')
[ -z "${swapin:-}" ] && swapin=0

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

# Seats are driven by BUILDER.md / REVIEWER.md, not by /consciousness:on.
# The consciousness plugin is enabled only in this repo's .claude/settings.json, and a
# --bg seat does not register project-scoped plugins even with --setting-sources, so
# every seat died on "Unknown command: /consciousness:on" and sat in state 'blocked'.
# The PGPS CLIs themselves work fine through node, so the runbooks drive the same loop
# by hand. --setting-sources is kept: it costs nothing and restores the plugin if the
# repo is later trusted interactively.
start_seat() {
  timeout 120 env -C "$REPO" claude --bg --name "$1" --model sonnet --effort high \
      --setting-sources user,project,local \
      --permission-mode bypassPermissions "$2" >/dev/null 2>&1
  local rc=$?
  if [ $rc -eq 0 ]; then
    note seat-started "$1 sonnet/high free=${free_gb}GB load=${load1} swapin=${swapin}KB/s"
  else
    note seat-failed "$1 exit=$rc — claude --bg did not start"
  fi
}

# Reviewer first: it unblocks features and is short-lived.
if [ "$awaiting" -gt 0 ] && [ "$live_reviewer" -eq 0 ]; then
  start_seat "dl-reviewer-$(date +%H%M%S)" \
    "Read REVIEWER.md in this repository and follow it exactly. You are the reviewer; do not write notebooks."
  exit 0
fi

if [ "$remaining" -gt 0 ] && [ "$live_builders" -lt "$MAX_BUILDERS" ]; then
  start_seat "dl-builder-$(date +%H%M%S)" \
    "Read BUILDER.md in this repository and follow it exactly, looping until no claimable task remains. You are unattended: never ask a question, never wait for input."
else
  note idle "remaining=${remaining} awaiting=${awaiting} builders=${live_builders} reviewer=${live_reviewer} — nothing to start"
fi
