# STORY-DL18: Style conformance audit against the operator's teaching standard

## User Story
As Claude I want to audit every deep-learning lesson against the operator's supervised-learning
reference lessons so that every lesson matches the Feynman voice, first-principles derivation, and
A-level-maths accessibility the operator's own teaching standard sets

## Context
Reference standard: supervised-learning's 1a/1b (logistic regression theory/practical), 2a/2b
(decision trees theory/practical), 2c (model comparison), 3a/3b (neural networks theory/practical).
Bar: Richard Feynman voice, first principles, performable by a rusty 18-year-old with good A-level
(not further) maths, runs end to end. A lesson that falls short gets its own refinement task rather
than a blanket rewrite.

## Acceptance Criteria
- [ ] Every one of the 20 deep-learning features (FEAT-DL1..DL20) has a recorded audit verdict
      against the reference standard
- [ ] Each lesson that falls short has its own refinement task filed, citing the specific gap

## Tasks
(minted in a follow-up commit via append-task-cli, once DIRECT-DL2 is visible on origin/main)

## Links
- Directive: DIRECT-DL2 (Maintain the curriculum as a living Feynman-style corpus)
