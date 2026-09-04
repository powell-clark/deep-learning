# TASK-DL33: X1 Debugging Deep Networks notebook

## Context
Deliverable: `notebooks/X1_debugging_deep_networks.ipynb` for STORY-DL17 (Professional Practice Series). Cross-cutting practitioner skill, independent of any single architecture.

## Acceptance Criteria
- [ ] **AC-1** — Presents a taxonomy of loss-curve pathologies and the cause each indicates
- [ ] **AC-2** — Demonstrates the overfit-one-batch test and shows both a pass and a deliberately induced failure
- [ ] **AC-3** — Shows how to find dead ReLUs and read per-layer gradient norms
- [ ] **AC-4** — Demonstrates locating a NaN and states the usual causes
- [ ] **AC-5** — Covers seeding and the remaining sources of non-determinism
- [ ] **AC-6** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-7** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-8** — Contains every section listed for `X1_debugging_deep_networks.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/X1_debugging_deep_networks.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL17 (Professional Practice Series)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
