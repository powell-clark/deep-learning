# TASK-DL042: Reap finished builder seats

## Context

Measured from eagle-peak 2026-09-05 09:50 bst via kernel/seat-resolve.sh and the harness agent list: seven dl-builder background seats alive and idle at once (dl-builder-051506, 054505, 060005, 061506, 063005, 064505, 070005; started 05:15 to 07:00, every one idle by 09:50) plus dl-reviewer-094505. scripts/supervisor.sh pins MAX_BUILDERS=1 for memory safety, yet the finished seats are never stopped, so the box carries seven idle Claude processes on the morning koi logged INC-KOI031 (hard freeze under earlyoom at 03:23) and nine further OOM kills. A seat whose BUILDER.md loop has ended is finished, not pending; it holds RAM and its worktree lock (four locked builder-dl* worktrees at 09:20) and adds nothing. AC: (1) each supervisor tick lists dl-builder-* and dl-reviewer-* sessions that are idle with no in_progress claim in TASK-ACTIVE-INDEX and stops them through the harness's own agent manager, logging seat-reaped with the id and age; (2) a seat mid-task (claim present or state busy) is never touched; (3) the count the MAX_BUILDERS gate reads excludes reaped seats, so a finished seat cannot pin the gate the way the phantom seat did on 2026-09-05 (the comment above the seats() counter); (4) the worktree of a reaped seat is removed once its branch is merged, closing the loop with TASK-DL038 (Name builder worktrees by seat). Filed by eagle-peak eglpk-d5eb9f7c; routed, not fixed, per the cockpit's lane.

## Acceptance criteria

- [x] **AC-1** — Each supervisor tick lists `dl-builder-*`/`dl-reviewer-*` background seats the harness itself reports as both `status: idle` AND `state: done`, and stops each one via `claude stop <id>` (the harness's own agent manager), logging `seat-reaped` with the id, name and age
- [x] **AC-2** — A seat mid-task is never touched: any seat whose `status`/`state` is not exactly idle+done is left alone; a seat whose own worktree (if any) still has uncommitted changes is skipped and logged `seat-skip` rather than stopped
- [x] **AC-3** — The `MAX_BUILDERS`/`live_reviewer` gate already excludes `state: done` seats (pre-existing `NONLIVE` set in `seats()`) — confirmed unchanged, not reimplemented
- [x] **AC-4** — A reaped seat's own worktree is unlocked (`git worktree unlock`) so the existing TASK-DL038 reap-worktree pass can remove it once merged and clean, closing the loop
- [x] **AC-5** — Verified against live data: filter logic tested against a real `claude agents --json` snapshot (dry run), then the reap executed for real, with before/after seat counts and worktree list recorded as evidence

## Closing Note
Verified in three stages against this machine's real state, not a synthetic fixture: (1) `bash -n scripts/supervisor.sh`
passed; (2) the filter (`kind==background`, name prefix `dl-builder-`/`dl-reviewer-`, `status==idle` AND `state==done`)
run read-only against a live `claude agents --json` snapshot correctly identified 5 idle+done seats and correctly
excluded the 2 busy/working ones (including this session itself); (3) executed for real — background session count
went from 8 to 7, with `dl-builder-054505`, `dl-builder-060005`, `dl-builder-064505` and `dl-reviewer-094505` all
confirmed stopped (gone from a follow-up `claude agents --json`), and `builder-dl4`'s worktree was reclaimed by the
existing TASK-DL038 reap-worktree pass once unlocked. One seat (`dl-builder-070005`) was idle+done at filter time but
had independently transitioned back to busy before this task's `claude stop` call landed — left untouched, consistent
with AC-2's mid-task protection (the harness's own status is authoritative at call time, not at filter time). AC-3
required no code change: the pre-existing `NONLIVE` set in `seats()` already excludes `state: done`, confirmed by
reading the function rather than re-implementing it.

## Dependencies

- Blocked by: none
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
- Builds on: TASK-DL038 (Name builder worktrees by seat) — reuses its worktree-reap safety logic

## Pre-mortem

### Failure modes

- Stopping a seat that is actually mid-task would corrupt or duplicate work — mitigated by requiring the harness's own `state: done` (not just `status: idle`, which could mean "paused, waiting") before ever calling `claude stop`
- Unlocking a worktree that is still legitimately in use (a stale `cwd` reading, or a seat that resumed after this check ran) could let it be removed on a later tick — mitigated by re-checking `git status --porcelain` immediately before unlocking, and only after the seat has already been confirmed idle+done by the harness's own state
- A seat's `cwd` may point at a worktree already removed by another process by the time this runs (observed live: `dl-builder-054505`'s `builder-dl` directory was already gone) — mitigated by an explicit `[ -d "$seat_cwd" ]` check; the code still stops the seat in that case since there is nothing left to protect

### Weak assumptions

- Assumes `claude stop <id>` accepts the `id` field `claude agents --json` returns (verified: matches the harness's own documented "short id `claude agents` lists")
- Assumes a seat's `cwd` field reliably names its own worktree, true only for a background seat that entered a worktree named via its own unique seat name (TASK-DL038) or whose `cwd` still reflects the worktree it is in; a seat that never entered a worktree (`cwd` == repo root) is handled by an explicit exclusion, not silently mismatched
