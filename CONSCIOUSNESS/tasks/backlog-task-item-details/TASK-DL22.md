# TASK-DL22: Lesson 10b The Transformer practical

## Context
Deliverable: `notebooks/10b_the_transformer_practical.ipynb` for STORY-DL11 (The Transformer). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Synthetic / tiny text.

## Acceptance Criteria
- [ ] **AC-1** — Implements a decoder-only transformer in PyTorch and trains it on a small task
- [ ] **AC-2** — Compares it against the Lesson 7 LSTM on the same task and budget
- [ ] **AC-3** — Ablates the number of heads or layers and reports the effect
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `10b_the_transformer_practical.ipynb` in `syllabus/manifest.yaml`

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
