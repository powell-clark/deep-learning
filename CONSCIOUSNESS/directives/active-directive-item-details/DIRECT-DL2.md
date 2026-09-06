# DIRECT-DL2: Maintain the curriculum as a living Feynman-style corpus

## Vision
DIRECT-DL1 shipped a complete 20-of-20-lesson curriculum. This directive keeps it that way as a
living portfolio piece rather than a closed project: continuously audited against the operator's
own teaching voice, kept current as libraries and datasets move, kept in visible lockstep with the
three sibling ML repos (supervised-learning, unsupervised-learning, reinforcement-learning), and
used deliberately as a test bed for the conscious loop on vs. off.

Operator, verbatim (2026-09-06 14:48): "make me a nice portfolio piece that later on I can use as
my syllabus to learn and update over time — the corpus is always updating itself — it is also an
excellent test bed for consciousness on and off, and it will forever need to be maintained."

## Scope
- STYLE CONFORMANCE: every lesson audited against the operator's own supervised-learning reference
  lessons (1a/1b logistic regression, 2a/2b decision trees, 2c model comparison, 3a/3b neural
  networks) for Richard Feynman voice, first-principles derivation, performability by a rusty
  18-year-old with good A-level (not further) maths, and end-to-end runnability. A lesson that
  falls short gets its own refinement task.
- CURRENCY: a bounded refresh cadence — library versions, datasets, and a notebook execution sweep
  — so the corpus keeps itself current without unbounded standing spend.
- LOCKSTEP: the four ML repos (deep-learning, supervised-learning, unsupervised-learning,
  reinforcement-learning) share one README shape and one status line; the kernel measured they do
  not today.
- CONSCIOUSNESS TEST BED: every task filed under this directive records whether it ran with the
  conscious loop on or off, so this directive doubles as a live on/off comparison.

## Stories
- STORY-DL18 Style conformance audit against the operator's teaching standard
- STORY-DL19 Bounded currency refresh cadence
- STORY-DL20 README/status lockstep across the four ML repos
- STORY-DL21 Consciousness on/off test bed recording

## Success Metrics
- Every one of the 20 lessons has a recorded audit verdict against the style standard, with a
  refinement task filed for each that falls short.
- The refresh cadence has a real bound (frequency, scope, and a spend/seat cap) — not an
  unattended standing loop.
- All four ML repos' README status lines are structurally identical and independently verifiable.
- Every task under this directive carries a loop-state field (on/off) in its detail card.

## Sequencing
Style conformance audit first (this directive's first task) → currency cadence defined →
lockstep pass → ongoing on/off recording across all of the above.
