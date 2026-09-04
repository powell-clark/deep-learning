# TASK-DL18: Lesson 8b Embeddings and Tokenisation practical

## Context
Deliverable: `notebooks/8b_embeddings_tokenisation_practical.ipynb` for STORY-DL9 (Embeddings and Tokenisation). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Small corpus.

## Acceptance Criteria
- [ ] **AC-1** — Implements byte-pair encoding from scratch and matches its behaviour against the `tokenizers` library
- [ ] **AC-2** — Shows how tokenisation choices change sequence length and vocabulary size
- [ ] **AC-3** — Visualises a pretrained embedding space in two dimensions
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `8b_embeddings_tokenisation_practical.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/8b_embeddings_tokenisation_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL17
- Story: STORY-DL9 (Embeddings and Tokenisation)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
