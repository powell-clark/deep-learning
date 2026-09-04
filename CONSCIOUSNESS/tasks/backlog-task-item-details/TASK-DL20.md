# TASK-DL20: Lesson 9b Attention practical

## Context
Deliverable: `notebooks/9b_attention_practical.ipynb` for STORY-DL10 (Attention). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Synthetic.

## Acceptance Criteria
- [ ] **AC-1** — Trains a seq2seq model with attention on a synthetic task and beats a no-attention baseline
- [ ] **AC-2** — Plots attention heatmaps and interprets at least one alignment
- [ ] **AC-3** — Shows how masking changes the attention distribution
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `9b_attention_practical.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/9b_attention_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL19
- Story: STORY-DL10 (Attention)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
