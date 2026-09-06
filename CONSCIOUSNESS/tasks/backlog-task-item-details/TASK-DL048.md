# TASK-DL048: Audit all 20 lessons against the supervised-learning style standard

## Context

Grade each of FEAT-DL1..DL20 against supervised-learning's 1a/1b, 2a/2b, 2c, 3a/3b for Feynman voice, first-principles derivation, A-level-maths accessibility, and end-to-end runnability. File one refinement task per lesson that falls short, citing the specific gap. Consciousness loop: OFF (interactive session, dl-f4bc4d14).

## Acceptance criteria

- [ ] Each of FEAT-DL1..DL20 read in full (both theory and practical notebooks where paired) and
      graded against the reference standard: Feynman voice, first-principles derivation before
      any library call, performable by an 18-year-old with good A-level (not further) maths, and
      end-to-end runnability on free Colab CPU
- [ ] Grading recorded per feature: pass, or fall-short with the specific gap named (voice,
      derivation, level, or runnability)
- [ ] One refinement task filed per fall-short feature, each citing its specific gap and linked to
      STORY-DL18 and the relevant FEAT-DL id
- [ ] A summary verdict (N of 20 pass, N refinement tasks filed) reported before this task closes

## Dependencies

- Directive: DIRECT-DL2
- Story: STORY-DL18

## Pre-mortem

### Failure modes

- Grading against a vague memory of the reference lessons rather than reading them fresh risks
  drifting the bar over the course of 20 audits — mitigate by re-reading the specific reference
  notebook (1a/1b, 2a/2b, 2c, or 3a/3b, whichever is closest in kind) alongside each lesson being
  graded, not from a single up-front skim
- Grading the whole 20-lesson curriculum in one sitting risks rubber-stamping the later lessons
  under fatigue — mitigate by treating each grading as its own read, with the standard restated
  each time rather than carried forward as an impression
- Filing a refinement task for a stylistic preference rather than a genuine gap against the stated
  bar (voice/derivation/level/runnability) would multiply low-value work — mitigate by requiring
  each fall-short verdict to name which of the four specific bar criteria it fails

### Weak assumptions

- Assumes the reference lessons (supervised-learning 1a/1b, 2a/2b, 2c, 3a/3b) are themselves stable
  during this audit — if they change mid-audit, note the version graded against
- Assumes "runs end to end" can be checked by reading the notebook and its already-recorded
  deterministic-verifier pass (FEAT-DL3) rather than re-executing all 36+ notebooks fresh; a
  refinement task should re-run a notebook directly only if the read raises a specific doubt
