# TASK-DL16: Lesson 7b Sequence Models practical

## Context
Deliverable: `notebooks/7b_sequence_models_practical.ipynb` for STORY-DL8 (Sequence Models). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Tiny text corpus.

## Acceptance Criteria
- [x] **AC-1** — Trains an LSTM language model in PyTorch and reports perplexity
- [x] **AC-2** — Generates samples and shows how temperature changes them
- [x] **AC-3** — Demonstrates teacher forcing and gradient clipping
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `7b_sequence_models_practical.ipynb` in `syllabus/manifest.yaml`

## Closing Note
`scripts/verify_notebook.sh notebooks/7b_sequence_models_practical.ipynb` → `PASS: 7b_sequence_models_practical.ipynb — clean execution in 8s (cap 600s)`.
An `nn.LSTM` character language model trains with minibatched teacher forcing and
gradient-clipped Adam (clip threshold deliberately set below this run's typical
unclipped norm so clipping visibly engages, on 177/400 steps), reports held-out
perplexity (34.6, below the 46-character uniform-guessing baseline), and samples
autoregressively at three temperatures showing the expected coherence/diversity
trade-off. Corpus is the same embedded public-domain text as 7a, extended with a
held-out validation split — no download, no local setup required.

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/7b_sequence_models_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL15
- Story: STORY-DL8 (Sequence Models)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
