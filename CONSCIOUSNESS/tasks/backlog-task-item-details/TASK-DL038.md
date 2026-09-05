# TASK-DL038: Name builder worktrees by seat

## Context

Routed in-house from Claude Code feedback draft 54869f4a-621e-4b1c-b482-bc6160fff1b9 (2026-09-05 08:57Z, session 05ce3eea). Two dl-builder background sessions both called EnterWorktree with name builder-dl3; the harness resumed the second into a worktree the first was still editing (notebooks/11a_*.ipynb under a live nbconvert --execute, jobs 01f75049 and 05ce3eea), so two sessions committed, rebased and pushed against one working directory. Measured at 09:20 bst: worktrees builder-dl, builder-dl2, builder-dl3, builder-dl4 all locked, three at commit 5d1baeb, dl2 and dl4 on detached HEAD. Cause on our side: BUILDER.md gives no worktree-naming rule, so each builder guesses builder-dl<N>, while scripts/supervisor.sh already mints a unique seat name dl-builder-HHMMSS. AC: (1) BUILDER.md, or the start prompt in supervisor.sh, instructs EnterWorktree with the seat name so names cannot collide; (2) a builder that finds its worktree already present treats that as a fault and stops rather than resuming; (3) supervisor.sh removes builder-dl* worktrees whose branch is merged, so the stale set above does not grow. The harness half (resume-by-name does not check live occupancy) went to Anthropic as the draft. Filed by eagle-peak eglpk-d5eb9f7c.

## Acceptance criteria

- [ ] _(to be filled in)_

## Dependencies

- _(to be filled in)_

## Pre-mortem

### Failure modes

- _(to be filled in)_

### Weak assumptions

- _(to be filled in)_
