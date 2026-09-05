# TASK-DL20: Lesson 9b Attention practical

## Context
Deliverable: `notebooks/9b_attention_practical.ipynb` for STORY-DL10 (Attention). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Synthetic.

## Acceptance Criteria
- [x] **AC-1** — Trains a seq2seq model with attention on a synthetic task and beats a no-attention baseline
- [x] **AC-2** — Plots attention heatmaps and interprets at least one alignment
- [x] **AC-3** — Shows how masking changes the attention distribution
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `9b_attention_practical.ipynb` in `syllabus/manifest.yaml`

## Closing Note
`scripts/verify_notebook.sh notebooks/9b_attention_practical.ipynb` → `PASS: 9b_attention_practical.ipynb — clean execution in 64s (cap 600s)`.
On a synthetic sequence-reversal task (L=16), an attention seq2seq model reaches 99.6% token
accuracy vs. a no-attention baseline's 84.6% at the identical training budget (3000 steps).
The learned attention heatmap's peak position correlates -0.99 with decoder step against the
true reversal alignment (a strong monotonic trend, not a perfectly crisp diagonal — a few
consecutive steps share their peak across adjacent positions, consistent with the LSTM
encoder blending neighbouring positions through its own recurrence). Padding-mask demo:
unmasked attention puts 71% of its weight on padding positions; masked, exactly 0%.

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
