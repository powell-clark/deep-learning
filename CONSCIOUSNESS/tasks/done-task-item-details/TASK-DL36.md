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

## Closing Note
`scripts/verify_notebook.sh notebooks/X4_research_frontiers.ipynb` — PASS, clean execution in
6s (cap 600s). A power-law fit to 4 small synthetic runs extrapolates 3 orders of magnitude to
within 0.75% relative error, illustrating what scaling laws let a practitioner forecast; a real
top-1 mixture-of-experts layer measures 8x the feed-forward capacity of an equivalently-sized
dense layer at identical per-token FLOPs, with genuinely non-uniform routing from random init;
an O(T) state-space recurrence vs. O(T^2) attention FLOP count shows a 64x gap by T=4096; a
from-scratch CLIP-style contrastive loss scores aligned image/text embeddings far below
misaligned ones (0.0000 vs. 4.2499 nats); and an attention-visualisation interpretability probe
correctly recovers two designed token-to-token matches on an engineered toy sequence.
