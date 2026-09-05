# TASK-DL039: Move claimed task detail cards to active dir

## Context

Discovered while working TASK-DL038 (2026-09-05): BUILDER.md's claim step (update-task-status-cli --to in_progress) never git-mv's the detail card from backlog-task-item-details/ to active-task-item-details/, even though that directory exists and PGPS validation expects it there. Every task ever claimed via BUILDER.md (TASK-DL13, DL24, DL25, DL26, DL28, DL29, DL31, DL32, DL36 all observed) trips 'Misplaced detail: ... is in backlog/ dir but indexed as active' as a result. Fix: BUILDER.md step 2 (Claim it) should git mv the card backlog-task-item-details/TASK-DLn.md -> active-task-item-details/TASK-DLn.md (and fix the doc column) alongside the status transition, mirroring the existing done-transition move in step 6.

## Acceptance criteria

- [ ] _(to be filled in)_

## Dependencies

- _(to be filled in)_

## Pre-mortem

### Failure modes

- _(to be filled in)_

### Weak assumptions

- _(to be filled in)_
