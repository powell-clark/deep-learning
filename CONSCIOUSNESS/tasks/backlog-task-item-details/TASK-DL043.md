# TASK-DL043: BUILDER.md worktree naming collision

## Context

Routed by route-feedback from Claude Code feedback draft 54869f4a-621e-4b1c-b482-bc6160fff1b9 (2026-09-05T07:57:27.481Z, session 05ce3eea-3efb-4135-a9bc-19604ce61d57, cwd /home/powell-clark/projects/auxiliary/deep-learning/.claude/worktrees/builder-dl3, claude-sonnet-5 on 2.1.261). Verdict FOREIGN; markers: EnterWorktree tool, background session manager, harness tool; repo files named: BUILDER.md. Draft file left in place for the operator to discard. Draft title: EnterWorktree let two background jobs attach to the same named worktree concurrently Draft details: **What happened:** EnterWorktree({name: "builder-dl3"}) reported "A worktree with this name already existed and was resumed as-is" and attached me to it. Mid-session I found a second, different background job (visible via its tmp dir /home/powell-clark/.claude/jobs/01f75049/tmp/nbcheck5 and a live `nbconvert --execute` process with cwd in that same worktree) actively editing the same file (notebooks/11a_*.ipynb) in real time, uncommitted, concurrently with my own git commits/rebases/pushes in that worktree. ListAgents confirmed 8+ parallel "dl-builder-*" background sessions running against the same repo.
**What the user said:** User didn't comment; observed by the model while executing an autonomous BUILDER.md task loop.
**Repro:** Run several parallel background jobs (e.g. via a fleet of `dl-builder-*` seats) that each call EnterWorktree with a default/auto-generated name against the same repo; at least two can resolve to the same worktree name and both get attached, driving concurrent git operations (commit/rebase/push) and file edits against one shared working directory.
**Evidence:** worktree path .claude/worktrees/builder-dl3; colliding job tmp dir /home/powell-clark/.claude/jobs/01f75049/tmp/nbcheck5; my own job dir /home/powell-clark/.claude/jobs/05ce3eea; git lock file at .git/worktrees/builder-dl3/locked recorded a generic bg-spare pid rather than either job's real identity, giving no way to detect the second occupant except by manual process inspection.
**Cause:** EnterWorktree's "resume existing worktree by name" path does not check whether another live session already holds/is actively using that worktree before attaching a second session to it.

## Acceptance criteria

- [ ] _(to be filled in)_

## Dependencies

- _(to be filled in)_

## Pre-mortem

### Failure modes

- _(to be filled in)_

### Weak assumptions

- _(to be filled in)_
