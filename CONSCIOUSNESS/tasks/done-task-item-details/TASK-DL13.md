# TASK-DL13: Lesson 6a Modern Architectures and Transfer Learning theory

## Context
Deliverable: `notebooks/6a_modern_architectures_theory.ipynb` for STORY-DL7 (Modern Architectures and Transfer Learning). Theory: derive from first principles and implement from scratch in NumPy. Data: Small image set.

## Acceptance Criteria
- [x] **AC-1** — Explains why residual connections ease optimisation, with the gradient-flow argument
- [x] **AC-2** — Compares pre-activation and post-activation norm placement
- [x] **AC-3** — Explains depthwise-separable convolution and its parameter saving with the arithmetic
- [x] **AC-4** — Summarises the architecture families and what each changed
- [x] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-7** — Contains every section listed for `6a_modern_architectures_theory.ipynb` in `syllabus/manifest.yaml`

## Closing note
`scripts/verify_notebook.sh` — PASS: clean execution in 7s (cap 600s), 21 cells, all 7 required headings present, no committed outputs.

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/6a_modern_architectures_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL7 (Modern Architectures and Transfer Learning)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
