# TASK-DL16: Lesson 7b Sequence Models practical

## Context
Deliverable: `notebooks/7b_sequence_models_practical.ipynb` for STORY-DL8 (Sequence Models). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Tiny text corpus.

## Acceptance Criteria
- [ ] **AC-1** — Trains an LSTM language model in PyTorch and reports perplexity
- [ ] **AC-2** — Generates samples and shows how temperature changes them
- [ ] **AC-3** — Demonstrates teacher forcing and gradient clipping
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `7b_sequence_models_practical.ipynb` in `syllabus/manifest.yaml`

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
