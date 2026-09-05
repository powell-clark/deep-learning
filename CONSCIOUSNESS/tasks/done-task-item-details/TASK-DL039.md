# TASK-DL039: Move claimed task detail cards to active dir

## Context

Discovered while working TASK-DL038 (2026-09-05): BUILDER.md's claim step (update-task-status-cli --to in_progress) never git-mv's the detail card from backlog-task-item-details/ to active-task-item-details/, even though that directory exists and PGPS validation expects it there. Every task ever claimed via BUILDER.md (TASK-DL13, DL24, DL25, DL26, DL28, DL29, DL31, DL32, DL36 all observed) trips 'Misplaced detail: ... is in backlog/ dir but indexed as active' as a result. Fix: BUILDER.md step 2 (Claim it) should git mv the card backlog-task-item-details/TASK-DLn.md -> active-task-item-details/TASK-DLn.md (and fix the doc column) alongside the status transition, mirroring the existing done-transition move in step 6.

## Acceptance criteria

- [x] **AC-1** — BUILDER.md step 2 (Claim it) `git mv`s the detail card from `backlog-task-item-details/TASK-DLn.md` to `active-task-item-details/TASK-DLn.md` and fixes the `doc` column in `TASK-ACTIVE-INDEX.md` to match, alongside the status transition to `in_progress`
- [x] **AC-2** — BUILDER.md step 6 (Close the task) `git mv`s the card from `active-task-item-details/` (not `backlog-task-item-details/`) to `done-task-item-details/`, matching where step 2 now leaves it
- [x] **AC-3** — PGPS validation shows zero "Misplaced detail: ... is in backlog/ dir but indexed as active" errors for any task this fix's steps touch

## Closing Note
BUILDER.md step 2 now `git mv`s the claimed card into `active-task-item-details/` and fixes
`TASK-ACTIVE-INDEX.md`'s `doc` column, guarded by a check for whether the CLI already relocated it
(observed: it does for a stub/no-contract card, as happened for both DL038 and DL039 themselves, but not
for a properly-specified one). Step 6 now tries `active-task-item-details/` first and falls back to
`backlog-task-item-details/` for any task claimed before this fix landed. Verified via
`node pgps/main.js --headless` reporting 52/52 with zero misplaced-detail errors after this task's own
claim-and-close cycle exercised the new step 2/6 paths on itself.

## Dependencies

- Blocked by: none
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)

## Pre-mortem

### Failure modes

- Step 6's `git mv` source path assumption (`active-task-item-details/`) would break for any task claimed before this fix landed, whose card is still sitting in `backlog-task-item-details/` — mitigated by leaving those alone; the fix only changes behaviour for tasks claimed from here on

### Weak assumptions

- Assumes `update-task-status-cli.js`'s own inconsistent behaviour (it relocates a *stub, no-contract* card to `active-task-item-details/` automatically, as observed on TASK-DL038 and TASK-DL039 themselves, but left properly-specified cards — TASK-DL31, TASK-DL32, and others — untouched in `backlog-task-item-details/` while `in_progress`) is not something this task should try to fix at the CLI level; BUILDER.md instructing the `git mv` explicitly is the more robust fix since it does not depend on that internal behaviour
