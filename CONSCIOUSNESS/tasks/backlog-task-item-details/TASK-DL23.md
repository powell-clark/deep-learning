# TASK-DL23: Lesson 11a Language Model Pretraining theory

## Context
Deliverable: `notebooks/11a_lm_pretraining_theory.ipynb` for STORY-DL12 (Language Model Pretraining). Theory: derive from first principles and implement from scratch in NumPy. Data: Tiny Shakespeare.

## Acceptance Criteria
- [ ] **AC-1** — States the autoregressive objective and derives its cross-entropy loss
- [ ] **AC-2** — Defines perplexity and relates it to the loss
- [ ] **AC-3** — Explains scaling intuition: how loss responds to parameters, data and compute
- [ ] **AC-4** — Implements the mini-GPT forward pass and loss in NumPy for a single batch and checks it against PyTorch
- [ ] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-7** — Contains every section listed for `11a_lm_pretraining_theory.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/11a_lm_pretraining_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL12 (Language Model Pretraining)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
