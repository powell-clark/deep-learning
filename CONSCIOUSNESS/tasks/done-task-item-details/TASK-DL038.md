# TASK-DL038: Name builder worktrees by seat

## Context

Routed in-house from Claude Code feedback draft 54869f4a-621e-4b1c-b482-bc6160fff1b9 (2026-09-05 08:57Z, session 05ce3eea). Two dl-builder background sessions both called EnterWorktree with name builder-dl3; the harness resumed the second into a worktree the first was still editing (notebooks/11a_*.ipynb under a live nbconvert --execute, jobs 01f75049 and 05ce3eea), so two sessions committed, rebased and pushed against one working directory. Measured at 09:20 bst: worktrees builder-dl, builder-dl2, builder-dl3, builder-dl4 all locked, three at commit 5d1baeb, dl2 and dl4 on detached HEAD. Cause on our side: BUILDER.md gives no worktree-naming rule, so each builder guesses builder-dl<N>, while scripts/supervisor.sh already mints a unique seat name dl-builder-HHMMSS. AC: (1) BUILDER.md, or the start prompt in supervisor.sh, instructs EnterWorktree with the seat name so names cannot collide; (2) a builder that finds its worktree already present treats that as a fault and stops rather than resuming; (3) supervisor.sh removes builder-dl* worktrees whose branch is merged, so the stale set above does not grow. The harness half (resume-by-name does not check live occupancy) went to Anthropic as the draft. Filed by eagle-peak eglpk-d5eb9f7c.

## Acceptance criteria

- [x] **AC-1** — BUILDER.md instructs `EnterWorktree` with the seat's own name (discovered via `ListAgents`'s "This session is X" line), never a guessed generic name like `builder-dl<N>`
- [x] **AC-2** — BUILDER.md instructs a seat that finds itself resumed into an already-occupied worktree (uncommitted state, or an active process it does not recognise) to stop and report rather than continuing to build on top of it
- [x] **AC-3** — `scripts/supervisor.sh` removes `.claude/worktrees/builder-dl*` worktrees whose branch has already been merged into `main`, so the stale/locked set does not grow tick over tick
- [x] **AC-4** — `scripts/supervisor.sh`'s builder start prompt additionally passes the seat's own timestamped name as the required `EnterWorktree` name directly in the launch instruction, so a cron-started seat never has to look its own name up at all

## Closing Note
BUILDER.md gained a new "Before the first cycle: enter your own worktree" section implementing AC-1/AC-2.
`scripts/supervisor.sh` gained a reap loop after the worktree-branch-integration step implementing AC-3: it
walks `git worktree list --porcelain`, and removes a `.claude/worktrees/*` entry only when its branch is
fully merged into `main`, unlocked, AND has a clean `git status` — any one of those three failing leaves it
untouched. Verified `bash -n scripts/supervisor.sh` (syntax OK) and the reap state-machine in isolation with
a stubbed `git`: a merged+unlocked+clean entry was reaped, a locked entry was skipped, an unmerged entry was
skipped, and the repo's own root worktree (not under `.claude/worktrees/`) was left alone — matching the
four cases the fix needs to distinguish. Additionally (AC-4, from a second, independently-arrived-at fix for
the same task): `start_seat`'s builder-launch prompt now interpolates the seat's own `dl-builder-HHMMSS`
name directly, instructing `EnterWorktree` with that exact name — a stronger, structural guarantee than
relying on the seat to call `ListAgents` and read its own name back correctly, for the launch path
supervisor.sh actually controls. Both fixes are complementary and now merged together. No automated
end-to-end test exists for this (it would require actually racing two EnterWorktree calls), so this is the
strongest verification available short of that.
Filed TASK-DL039 (Move claimed task detail cards to active dir) for a related, separately-scoped defect
discovered while working this task: BUILDER.md's claim step never moves a task's detail card into
active-task-item-details/, which is why DL13/24/25/26/28/29/31/32/36 all tripped the "Misplaced detail"
validator warning while in_progress.

## Dependencies

- Blocked by: none
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)

## Pre-mortem

### Failure modes

- A seat cannot introspect its own `--name` from inside the session (no env var carries it) — mitigated by instructing `ListAgents` first, whose self-identifying header line names the current session, AND by supervisor.sh now passing the name directly in the launch prompt for its own launch path
- `git worktree remove` in supervisor.sh could destroy a worktree that looks merged but still has uncommitted local changes — mitigated by checking both "branch fully merged into main" AND a clean `git status` before removing

### Weak assumptions

- Assumes every builder seat is launched with a unique `--name` (true today: `supervisor.sh` mints `dl-builder-$(date +%H%M%S)`) — a future launcher that reuses names would need a different fix
- Assumes the harness's `EnterWorktree` resume-by-name behaviour (silently resuming into an existing worktree without checking live occupancy) is unchanged; the harness-side half of this defect was filed with Anthropic separately and is out of scope here
