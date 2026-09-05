# TASK-DL22: Lesson 10b The Transformer practical

## Context
Deliverable: `notebooks/10b_the_transformer_practical.ipynb` for STORY-DL11 (The Transformer). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Synthetic / tiny text.

## Acceptance Criteria
- [x] **AC-1** — Implements a decoder-only transformer in PyTorch and trains it on a small task
- [x] **AC-2** — Compares it against the Lesson 7 LSTM on the same task and budget
- [x] **AC-3** — Ablates the number of heads or layers and reports the effect
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `10b_the_transformer_practical.ipynb` in `syllabus/manifest.yaml`

## Closing Note
`scripts/verify_notebook.sh notebooks/10b_the_transformer_practical.ipynb` → `PASS:
10b_the_transformer_practical.ipynb — clean execution in 41s (cap 600s)`. A decoder-only
Transformer (75,566 params) and 7b's CharLSTM (90,350 params) are trained on the identical
corpus, split and 400-iteration budget; both reach comparably low train loss (0.367 vs 0.250)
but the LSTM generalises better on this tiny corpus (29.5 vs 49.8 held-out perplexity — the
Transformer actually lands above the uniform-guessing baseline of 46). The layer-count
ablation explains why: a 1-layer Transformer (26.6 perplexity) beats both the LSTM and every
deeper variant, with perplexity worsening monotonically as layers are added — a training set
this small rewards less capacity, an honest result reported as found rather than tuned away.

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/10b_the_transformer_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL21
- Story: STORY-DL11 (The Transformer)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
