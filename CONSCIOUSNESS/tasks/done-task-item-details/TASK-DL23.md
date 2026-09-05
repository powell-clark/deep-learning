# TASK-DL23: Lesson 11a Language Model Pretraining theory

## Context
Deliverable: `notebooks/11a_lm_pretraining_theory.ipynb` for STORY-DL12 (Language Model Pretraining). Theory: derive from first principles and implement from scratch in NumPy. Data: Tiny Shakespeare.

## Acceptance Criteria
- [x] **AC-1** — States the autoregressive objective and derives its cross-entropy loss
- [x] **AC-2** — Defines perplexity and relates it to the loss
- [x] **AC-3** — Explains scaling intuition: how loss responds to parameters, data and compute
- [x] **AC-4** — Implements the mini-GPT forward pass and loss in NumPy for a single batch and checks it against PyTorch
- [x] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-7** — Contains every section listed for `11a_lm_pretraining_theory.ipynb` in `syllabus/manifest.yaml`

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

## Closing Note
`scripts/verify_notebook.sh notebooks/11a_lm_pretraining_theory.ipynb` — PASS, clean execution
in 11s (cap 600s). Derives the chain-rule factorisation and cross-entropy loss (verified exactly
against a hand-reconstructed joint distribution, max diff 6.94e-18), defines perplexity from the
loss (uniform baseline over the corpus's 65-character vocabulary gives perplexity 65.00 exactly),
empirically demonstrates power-law-shaped loss scaling across four model widths trained in 2s
total, and implements the full mini-GPT forward pass and cross-entropy loss from scratch in
NumPy, matched against an equivalent batched PyTorch computation to floating-point precision
(max logit diff 8.33e-17, loss diff 0.00e+00).
