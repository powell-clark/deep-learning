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

# Builder seats work in a linked worktree on their own branch (the AGENTS.md rule:
# feature work never happens on a branch in a shared checkout). Their commits therefore
# land on origin/worktree-* and NOT on main, so main's indexes read "nothing done" while
# notebooks pile up on a branch, and the corpus never assembles where the operator looks.
# Fast-forward only: if the histories have diverged this does nothing and says so, rather
# than attempting a merge no one asked for.
timeout 60 git fetch origin -q 2>/dev/null || true
# Fast-forward when the histories still line up, and fall back to a real merge when
# they do not. Fast-forward-only was not enough: the moment ANY commit lands on main
# that the builder branch does not carry -- a supervisor fix, an operator edit -- the
# two histories diverge permanently and --ff-only silently does nothing on every tick
# thereafter. Measured 2026-09-05: main sat 1 ahead / 4 behind for three ticks with
# three finished notebooks invisible on main and no log line saying so.
# The merge is safe here: the id-bearing append-only indexes carry merge=union with a
# CI duplicate-id backstop, and notebooks are new files. A genuine conflict aborts and
# is reported rather than half-resolved.
for br in $(git branch -r --format='%(refname:short)' 2>/dev/null | grep -E 'origin/worktree-' || true); do
  before=$(git rev-parse --short HEAD)
  if timeout 60 git merge --ff-only "$br" -q 2>/dev/null; then
    :
  elif timeout 120 git merge --no-edit -m "chore: integrate $br into main" "$br" -q 2>/dev/null; then
    :
  else
    timeout 60 git merge --abort 2>/dev/null || true
    note merge-conflict "could not integrate $br into main; left main untouched"
    continue
  fi
  after=$(git rev-parse --short HEAD)
  if [ "$before" != "$after" ]; then
    note integrated "main $before -> $after from $br"
    timeout 60 git push origin main -q 2>/dev/null || note push-skipped "could not push main"
  fi
done

# Builder worktrees accumulate under .claude/worktrees/ across many short-lived seats
# (TASK-DL038: four builder-dl* worktrees observed locked on 2026-09-05, none ever
# reclaimed). Remove one only once its branch is fully merged into main, it is not
# locked, and it has no uncommitted changes -- any of those three can mean a seat is
# still actively using it, so a worktree failing any check is left alone untouched.
wt_path="" wt_branch="" wt_locked=0
reap_worktree() {
  [ -n "$wt_path" ] || return 0
  case "$wt_path" in "$REPO"/.claude/worktrees/*) ;; *) return 0 ;; esac
  [ "$wt_locked" -eq 0 ] || return 0
  [ -n "$wt_branch" ] || return 0
  timeout 10 git merge-base --is-ancestor "$wt_branch" main 2>/dev/null || return 0
  [ -z "$(timeout 10 git -C "$wt_path" status --porcelain 2>/dev/null)" ] || return 0
  if timeout 30 git worktree remove "$wt_path" 2>/dev/null; then
    note worktree-reaped "removed merged worktree $wt_path ($wt_branch)"
    git branch -d "$wt_branch" 2>/dev/null || true
  fi
}
while IFS= read -r line; do
  case "$line" in
    "worktree "*) reap_worktree; wt_path="${line#worktree }"; wt_branch=""; wt_locked=0 ;;
    "branch "*) wt_branch="${line#branch refs/heads/}" ;;
    locked*) wt_locked=1 ;;
  esac
done < <(timeout 10 git worktree list --porcelain 2>/dev/null)
reap_worktree

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

# Features never close on their own. Tasks auto-close (their gate is auto-approve), so
# the review sweep stays permanently empty and the reviewer seat was never started --
# which would have left all 20 features stranded in in_progress and declared the corpus
# ready anyway, because the terminal condition only looked at tasks. Count the open
# features so both the reviewer trigger and the terminal condition can see them.
features_open=$(grep -c '^FEAT-' CONSCIOUSNESS/features/FEATURE-ACTIVE-INDEX.md 2>/dev/null || echo 0)
[ -z "${features_open:-}" ] && features_open=0

# Count LIVE seats. The harness reports a working background session as state
# 'working', not 'running' — matching 'running' made this return 0 always, so
# MAX_BUILDERS never bound and the 02:15 tick started a second builder while the
# first was still going. Counting by exclusion from the terminal states is robust
# to further state names being added.
#
# 'blocked' is excluded too, alongside the terminal states — NOT treated as live.
# Measured 2026-09-05: dl-builder-022304 hit the account's rolling Claude usage cap
# mid-task at 02:11 ("You've hit your session limit"), its process then exited, and
# `claude agents --json` kept reporting it as state=blocked for 90+ minutes across
# six ticks — with MAX_BUILDERS=1 permanently pinned by that phantom seat while 17
# unblocked layer-0 tasks sat idle and every tick logged "nothing to start". These
# seats always launch with --permission-mode bypassPermissions, so 'blocked' can
# never mean a live permission wait for one of them; it only means stalled or dead.
# Excluding it risks a second seat starting against the same claimed task if the
# first one somehow resumes, but that is safe here: the hardened loop protocol's
# shipped-check pre-flight and BUILDER.md's push-before-build claim make a repeat
# claim a no-op and a repeat build detectable before it ships.
TERMINAL_STATES="done failed killed stopped cancelled error"
seats() { timeout 60 claude agents --json 2>/dev/null | timeout 20 python3 -c "import sys,json
NONLIVE={'done','failed','killed','stopped','cancelled','error','blocked'}
try:
    a=json.load(sys.stdin)
    print(sum(1 for s in a
              if (s.get('state') or '') not in NONLIVE
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
if [ "$remaining" -eq 0 ] && [ "$awaiting" -eq 0 ] && [ "$features_open" -eq 0 ] \
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

# Reviewer first: it unblocks features and is short-lived. Two triggers, not one --
# an explicit in_review row waiting for a verdict, OR the build having run out of tasks
# with features still open, which is the closeout pass.
#
# The closeout trigger is BOUNDED, and that bound is load-bearing rather than tidy.
# Features are kano=performance, so their gate is the agent tier, and the approve CLI
# only relocates a feature to the DONE index once the recorded verdicts reach
# min_agent_reviews. If that threshold is ever higher than what one reviewer pass
# records, features_open never falls, and an unbounded trigger would start a fresh
# Sonnet seat every 15 minutes forever -- burning subscription quota and loading the
# operator's workstation with nobody watching. Three attempts that do not move the
# number is a stall to report, not a condition to retry into.
CLOSEOUT_TRIES="$REPO/.dl-closeout-tries"
if [ "$live_reviewer" -eq 0 ] && { [ "$awaiting" -gt 0 ] || { [ "$remaining" -eq 0 ] && [ "$features_open" -gt 0 ]; }; }; then
  if [ "$awaiting" -eq 0 ]; then
    prev_open=$(cut -d' ' -f1 "$CLOSEOUT_TRIES" 2>/dev/null || echo "")
    tries=$(cut -d' ' -f2 "$CLOSEOUT_TRIES" 2>/dev/null || echo 0)
    [ -z "${tries:-}" ] && tries=0
    if [ "$prev_open" = "$features_open" ]; then
      tries=$(( tries + 1 ))
    else
      tries=1
    fi
    printf '%s %s\n' "$features_open" "$tries" > "$CLOSEOUT_TRIES"
    if [ "$tries" -gt 3 ]; then
      note closeout-stalled "features_open stuck at ${features_open} across ${tries} reviewer passes — verdicts are recording but not promoting; stopping rather than looping"
      touch "$SENTINEL"
      exit 0
    fi
  fi
  start_seat "dl-reviewer-$(date +%H%M%S)" \
    "Read REVIEWER.md in this repository and follow it exactly. You are the reviewer; do not write notebooks."
  exit 0
fi

if [ "$remaining" -gt 0 ] && [ "$live_builders" -lt "$MAX_BUILDERS" ]; then
  seat_name="dl-builder-$(date +%H%M%S)"
  # TASK-DL038: name the isolation worktree after this seat's own unique name,
  # never a guessed builder-dl<N> -- two seats guessing the same small integer
  # collided on one physical worktree directory (2026-09-05), each silently
  # overwriting the other's in-progress file edits.
  start_seat "$seat_name" \
    "Read BUILDER.md in this repository and follow it exactly, looping until no claimable task remains. You are unattended: never ask a question, never wait for input. When you isolate into a worktree, call EnterWorktree with name \"$seat_name\" exactly -- never guess a generic name. If EnterWorktree reports a worktree of that name already exists, treat that as a fault: stop and report rather than resuming into it."
else
  note idle "remaining=${remaining} awaiting=${awaiting} features=${features_open} builders=${live_builders} reviewer=${live_reviewer} — nothing to start"
fi
