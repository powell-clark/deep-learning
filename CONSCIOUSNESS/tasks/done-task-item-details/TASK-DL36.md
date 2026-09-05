# TASK-DL36: X4 Research Frontiers notebook

## Context
Deliverable: `notebooks/X4_research_frontiers.ipynb` for STORY-DL17 (Professional Practice Series). Cross-cutting practitioner skill, independent of any single architecture.

## Acceptance Criteria
- [x] **AC-1** — Explains scaling laws and what they predict
- [x] **AC-2** — Covers mixture-of-experts and state-space models as alternatives to dense transformers
- [x] **AC-3** — Covers multimodal models and interpretability as active directions
- [x] **AC-4** — Points to venues, reference texts and resources for staying current
- [x] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-7** — Contains every section listed for `X4_research_frontiers.ipynb` in `syllabus/manifest.yaml`

## Closing note
`scripts/verify_notebook.sh` — PASS: clean execution in 13s (cap 600s), 26 cells, all 8 required headings present, no committed outputs. Measures a power-law-then-plateau capacity-scaling curve; implements a toy top-1 MoE layer measuring active-vs-total parameter fraction and an analytic O(n^2) vs O(n) FLOP comparison for attention vs. state-space recurrence; trains a toy CLIP-style contrastive alignment between two encoders; shows a linear probe becoming able to decode XOR from a trained hidden layer but not from the raw input or an untrained network.

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/X4_research_frontiers.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL17 (Professional Practice Series)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
