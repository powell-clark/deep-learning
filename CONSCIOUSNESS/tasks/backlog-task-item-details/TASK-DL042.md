# TASK-DL042: Reap finished builder seats

## Context

Measured from eagle-peak 2026-09-05 09:50 bst via kernel/seat-resolve.sh and the harness agent list: seven dl-builder background seats alive and idle at once (dl-builder-051506, 054505, 060005, 061506, 063005, 064505, 070005; started 05:15 to 07:00, every one idle by 09:50) plus dl-reviewer-094505. scripts/supervisor.sh pins MAX_BUILDERS=1 for memory safety, yet the finished seats are never stopped, so the box carries seven idle Claude processes on the morning koi logged INC-KOI031 (hard freeze under earlyoom at 03:23) and nine further OOM kills. A seat whose BUILDER.md loop has ended is finished, not pending; it holds RAM and its worktree lock (four locked builder-dl* worktrees at 09:20) and adds nothing. AC: (1) each supervisor tick lists dl-builder-* and dl-reviewer-* sessions that are idle with no in_progress claim in TASK-ACTIVE-INDEX and stops them through the harness's own agent manager, logging seat-reaped with the id and age; (2) a seat mid-task (claim present or state busy) is never touched; (3) the count the MAX_BUILDERS gate reads excludes reaped seats, so a finished seat cannot pin the gate the way the phantom seat did on 2026-09-05 (the comment above the seats() counter); (4) the worktree of a reaped seat is removed once its branch is merged, closing the loop with TASK-DL038 (Name builder worktrees by seat). Filed by eagle-peak eglpk-d5eb9f7c; routed, not fixed, per the cockpit's lane.

## Acceptance criteria

- [ ] _(to be filled in)_

## Dependencies

- _(to be filled in)_

## Pre-mortem

### Failure modes

- _(to be filled in)_

### Weak assumptions

- _(to be filled in)_
