# TASK-DL045: Fix agent-approved verdicts never auto-promoting features

## Context

review/approve/cli.js's applyApprovalTransition() only auto-transitions in_review->done for isMachine (--machine-reviewed=N) and human-approved verdicts. The default plain verdict path (no flags, reviewer=agent, verdict=agent-approved) -- which is exactly the command REVIEWER.md instructs reviewers to run -- never calls autoTransitionToDone, even when the entity's own gate (minAgentReviews) is already satisfied by that verdict (sweep-cli's agentApprovals count treats agent-approved as qualifying). Effect: every agent-gated feature reviewed via the documented runbook command gets stuck at in_review forever. Confirmed stuck: FEAT-DL4, FEAT-DL5, FEAT-DL6, FEAT-DL7, FEAT-DL8, FEAT-DL9, FEAT-DL11, FEAT-DL12, FEAT-DL13, FEAT-DL14, FEAT-DL15, FEAT-DL16 -- all show 1/1 qualifying agent approval in 'node review/sweep-cli.js --json' yet remain status=in_review in FEATURE-ACTIVE-INDEX.md and are absent from FEATURE-MAINTAINED-DONE-INDEX.md. Fix: applyApprovalTransition should also call autoTransitionToDone when the plain agent-approved path pushes agentApprovals to >= the entity's resolved minAgentReviews (mirroring the isMachine threshold logic), gated by isEntityAutoFlow the same way the other paths are. Separately, someone (a builder or the neurologist) needs to run the one-off promotion for the 12 already-satisfied features listed above once the fix lands, since their verdicts are already recorded and should not need re-review.

## Acceptance criteria

- [ ] _(to be filled in)_

## Dependencies

- Directive: DIRECT-DL1
- Story: STORY-DL13
- Features: FEAT-DL16

## Pre-mortem

### Failure modes

- _(to be filled in)_

### Weak assumptions

- _(to be filled in)_
