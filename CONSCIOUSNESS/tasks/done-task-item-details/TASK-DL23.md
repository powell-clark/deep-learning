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
in 18s (cap 600s). Derives the autoregressive objective from the chain rule and confirms its
negative log-likelihood is numerically identical to one-hot cross-entropy; defines perplexity
and confirms a uniform baseline gives exactly PPL=65 on this corpus's vocabulary
(loss=ln(65)=4.174387 nats); demonstrates loss falling with parameters (training loss, fixed
data: 2.4002 to 1.1701 nats across five widths, 1,625 to 147,905 params) and with data (held-out
loss, fixed width: 7.2633 to 3.0720 nats across five data sizes, 500 to 8,000 chars); implements
the full decoder-only mini-GPT forward pass and cross-entropy loss from scratch in NumPy on a
real Tiny Shakespeare batch, matched against an equivalent PyTorch computation to floating-point
precision (max logit diff 1.67e-16, loss diff 0.00e+00).

Note on provenance: this notebook's body was produced by a different concurrent process/session
during this task's close-out (the working file was replaced mid-flow while this claim was still
active — see the builder session's final report for the full account). Before closing, the
data-scaling sweep was found to report *training* loss while varying the training-set size
itself, which rewards memorising a smaller set rather than generalising and made loss rise with
more data (500 chars: 0.037 nats vs. 8,000 chars: 2.01 nats) — the opposite of the intended
lesson and contradicted by its own printed output. Fixed by reporting loss on a fixed held-out
slice for the data sweep (training loss remains correct and unconfounded for the width sweep,
where data and steps are held fixed across runs); both curves are now genuinely, verifiably
monotonic. Markdown and axis labels were updated to match.
