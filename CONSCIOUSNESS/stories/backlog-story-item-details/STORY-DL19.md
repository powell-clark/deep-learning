# STORY-DL19: Bounded currency refresh cadence

## User Story
As Claude I want a bounded refresh cadence for the corpus so that library versions, datasets and
notebook executions stay current without becoming an unattended standing spend

## Context
"Bounded" is load-bearing (per infra-change-discipline and TASK-DL045's own lesson on unbounded
supervisor spend): a real cadence (frequency, scope of what gets checked) plus a stated cap
(seats/day or a spend ceiling), not a cron that runs forever on the hope that everything eventually
settles. Covers: pinned library version drift, dataset availability, and a periodic notebook
execution sweep (the deterministic verifier, per FEAT-DL3) to catch silent breakage.

## Acceptance Criteria
- [ ] A stated cadence (how often, what triggers a check) is documented
- [ ] A stated bound (per-run or per-day cap) is documented alongside it
- [ ] The cadence's first run has a real stop condition, not an open-ended loop

## Tasks
(none filed yet — this story's first task is filed once the audit in STORY-DL18 establishes what
needs refreshing)

## Links
- Directive: DIRECT-DL2 (Maintain the curriculum as a living Feynman-style corpus)
