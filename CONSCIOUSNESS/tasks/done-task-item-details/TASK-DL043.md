# TASK-DL043: BUILDER.md worktree naming collision

## Context

Routed by route-feedback from Claude Code feedback draft 54869f4a-621e-4b1c-b482-bc6160fff1b9 (2026-09-05T07:57:27.481Z, session 05ce3eea-3efb-4135-a9bc-19604ce61d57, cwd /home/powell-clark/projects/auxiliary/deep-learning/.claude/worktrees/builder-dl3, claude-sonnet-5 on 2.1.261). Verdict FOREIGN; markers: EnterWorktree tool, background session manager, harness tool; repo files named: BUILDER.md. Draft file left in place for the operator to discard. Draft title: EnterWorktree let two background jobs attach to the same named worktree concurrently Draft details: **What happened:** EnterWorktree({name: "builder-dl3"}) reported "A worktree with this name already existed and was resumed as-is" and attached me to it. Mid-session I found a second, different background job (visible via its tmp dir /home/powell-clark/.claude/jobs/01f75049/tmp/nbcheck5 and a live `nbconvert --execute` process with cwd in that same worktree) actively editing the same file (notebooks/11a_*.ipynb) in real time, uncommitted, concurrently with my own git commits/rebases/pushes in that worktree. ListAgents confirmed 8+ parallel "dl-builder-*" background sessions running against the same repo.
**What the user said:** User didn't comment; observed by the model while executing an autonomous BUILDER.md task loop.
**Repro:** Run several parallel background jobs (e.g. via a fleet of `dl-builder-*` seats) that each call EnterWorktree with a default/auto-generated name against the same repo; at least two can resolve to the same worktree name and both get attached, driving concurrent git operations (commit/rebase/push) and file edits against one shared working directory.
**Evidence:** worktree path .claude/worktrees/builder-dl3; colliding job tmp dir /home/powell-clark/.claude/jobs/01f75049/tmp/nbcheck5; my own job dir /home/powell-clark/.claude/jobs/05ce3eea; git lock file at .git/worktrees/builder-dl3/locked recorded a generic bg-spare pid rather than either job's real identity, giving no way to detect the second occupant except by manual process inspection.
**Cause:** EnterWorktree's "resume existing worktree by name" path does not check whether another live session already holds/is actively using that worktree before attaching a second session to it.

## Acceptance criteria

- [x] **AC-1** — Confirm the harness-side defect (`EnterWorktree`'s resume-by-name path attaching
      a second session without checking live occupancy) is genuinely FOREIGN — no file under this
      repo can fix it, since the fault lives inside the Claude Code harness itself, not in
      BUILDER.md, `scripts/supervisor.sh`, or any tracked repo file
- [x] **AC-2** — Confirm the repo-side mitigation for the same incident is already shipped:
      TASK-DL038 (Name builder worktrees by seat, done) makes every `dl-builder-*` seat's
      `EnterWorktree` name unique by construction (the seat's own `dl-builder-HHMMSS` name,
      passed directly in `supervisor.sh`'s launch prompt), so the specific collision this draft
      reproduces cannot recur for seats launched via `supervisor.sh` going forward
      — verified by rereading `scripts/supervisor.sh`'s `start_seat` call (line 244: passes
      `$seat_name` directly into the `EnterWorktree` instruction) and BUILDER.md's
      "Before the first cycle: enter your own worktree" section (line 25), both already in place
- [x] **AC-3** — Leave the feedback draft (54869f4a-621e-4b1c-b482-bc6160fff1b9) untouched for
      the operator to review and send to Anthropic themselves — a repo task cannot submit harness
      feedback on the operator's behalf, and the draft explicitly says it was "left in place for
      the operator to discard [or send]"
- [x] **AC-4** — Close this task with a note distinguishing the two halves of the original
      incident: harness-side (FOREIGN, tracked via the feedback draft, unfixable from this repo)
      and repo-side (fixed by TASK-DL038) — so a future reader does not reopen TASK-DL038 work
      looking for a harness fix that cannot live here

## Dependencies

- Blocked by: none
- Related: TASK-DL038 (Name builder worktrees by seat) — the repo-side mitigation for the same
  incident this draft documents the harness-side half of
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)

## Pre-mortem

### Failure modes

- Treating this as a normal repo defect and attempting a code change would fail by construction
  — there is no repo file that can make `EnterWorktree` check live occupancy before resuming a
  named worktree; that logic is inside the harness binary, outside this repository's tree.
- Silently closing this without cross-referencing TASK-DL038 would leave a future reader unable
  to tell whether the underlying problem was ever addressed at all.

### Weak assumptions

- Assumes the feedback draft file itself is still present at its recorded path for the operator
  to act on — this task does not move, edit, or delete that file, only records its existence and
  disposition in the PGPS.

## Closing Note
No verifier run applies — this is a documentation/closure task, not a notebook change. Confirmed
by direct inspection that both halves of the original incident are accounted for: the harness-side
`EnterWorktree` resume-by-name gap is genuinely FOREIGN (no repo file can check live occupancy
inside the harness binary) and remains only as feedback draft 54869f4a-621e-4b1c-b482-bc6160fff1b9
for the operator to send; the repo-side half is already fixed by TASK-DL038, verified live in
`scripts/supervisor.sh` line 244 (`start_seat` passes the seat's own `$seat_name` directly into the
`EnterWorktree` instruction) and `BUILDER.md`'s "Before the first cycle: enter your own worktree"
section. No further repo change needed for this task.
