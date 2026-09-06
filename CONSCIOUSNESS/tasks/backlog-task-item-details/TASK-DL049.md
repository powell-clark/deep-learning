# TASK-DL049: Agree and apply a shared README template across the four ML repos

## Context

Operator clarification 2026-09-06 15:01: lockstep means same style/format/status line across the four repo READMEs, not same content; each repo stays linked to its own public GitHub project. Scope: (1) one README template (section order, status line format, h1 style) agreed via the bus with the other three ML-repo seats -- supervised-learning is the reference since the operator wrote its early lessons; (2) every notebook carries a working Open-in-Colab badge pointing at the public GitHub path, verified by fetching the badge target, not just present; (3) README links to the GitHub project board; (4) a public-visibility check recorded in the audit. Do NOT build until the template is agreed cross-repo -- this task covers reaching agreement and then applying it, in that order.

## Acceptance criteria

- [ ] Current README shape of all four repos (deep-learning, supervised-learning,
      unsupervised-learning, reinforcement-learning) diffed and divergences listed
      (section order, status-line format, h1 style, Colab-badge presence)
- [ ] Template proposal agreed via the bus with the other three ML-repo seats, using
      supervised-learning's README as the reference shape (the operator wrote its early lessons)
      — not built until agreement is reached
- [ ] Template applied to all four repos' READMEs once agreed
- [ ] Every notebook in every one of the four repos carries an Open-in-Colab badge whose target
      URL is fetched and confirmed live (not just present in the markdown)
- [ ] Each README links to its own repo's GitHub project board
- [ ] Each repo's public/private visibility recorded as part of this audit's result

## Dependencies

- Directive: DIRECT-DL2
- Story: STORY-DL20

## Pre-mortem

### Failure modes

- Applying the template before the other three repos' seats agree risks three more rounds of
  rework when they push back on a section or status-line choice — mitigated by the explicit
  "agree first" gate already in this task's acceptance criteria
- Checking Colab badges by reading the markdown link text rather than fetching the target risks
  missing a badge that points at a private repo path or a renamed/moved notebook — mitigated by
  requiring a live fetch of the badge target, not just presence
- Treating "lockstep" as shared content (rather than shared shape) would contradict the operator's
  explicit clarification and produce four repos reading identically — mitigated by keeping this
  task scoped to structure/format/status-line only, never prose content

### Weak assumptions

- Assumes supervised-learning's current README shape is itself already correct to use as the
  reference — worth a quick sanity check before propagating it, since it was chosen for authorship
  provenance (operator wrote its early lessons) rather than because it was independently audited
- Assumes each repo's GitHub project board already exists to link to; if one repo has no project
  board yet, that's a gap to surface rather than a link to fabricate
