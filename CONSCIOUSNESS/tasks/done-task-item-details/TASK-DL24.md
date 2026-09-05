# TASK-DL24: Lesson 11b Language Model Pretraining practical

## Context
Deliverable: `notebooks/11b_lm_pretraining_practical.ipynb` for STORY-DL12 (Language Model Pretraining). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Tiny Shakespeare.

## Acceptance Criteria
- [x] **AC-1** — Trains a small GPT-style model for a bounded budget and shows the loss curve and generated samples
- [x] **AC-2** — Runs inference with a pretrained Hugging Face GPT-2 and compares its samples with the trained model's
- [x] **AC-3** — Shows how sampling parameters change generation
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `11b_lm_pretraining_practical.ipynb` in `syllabus/manifest.yaml`

## Closing Note
Trains 11a's decoder-only mini-GPT (learned positional embedding, 3 causal
Transformer blocks) end to end via PyTorch autograd on Tiny Shakespeare,
plots training loss and held-out perplexity, implements temperature/top-k
autoregressive sampling, and compares generated samples against a real
pretrained `distilgpt2` checkpoint from the same prompt. Verifier: PASS,
188s (cap 600s).

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/11b_lm_pretraining_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL23
- Story: STORY-DL12 (Language Model Pretraining)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
