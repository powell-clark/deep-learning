# TASK-DL18: Lesson 8b Embeddings and Tokenisation practical

## Context
Deliverable: `notebooks/8b_embeddings_tokenisation_practical.ipynb` for STORY-DL9 (Embeddings and Tokenisation). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Small corpus.

## Acceptance Criteria
- [x] **AC-1** — Implements byte-pair encoding from scratch and matches its behaviour against the `tokenizers` library
- [x] **AC-2** — Shows how tokenisation choices change sequence length and vocabulary size
- [x] **AC-3** — Visualises a pretrained embedding space in two dimensions
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `8b_embeddings_tokenisation_practical.ipynb` in `syllabus/manifest.yaml`

## Closing Note
`scripts/verify_notebook.sh notebooks/8b_embeddings_tokenisation_practical.ipynb` → `PASS: 8b_embeddings_tokenisation_practical.ipynb — clean execution in 10s (cap 600s)`.
A from-scratch BPE trainer is compared word-by-word against the Hugging Face `tokenizers`
library trained on identical text: 3/7 test words segment identically, the rest differ only
by tie-breaking on equally-frequent pairs or end-of-word-marker fusion timing, not by
algorithmic disagreement. Word-level/character-level/BPE trade-offs are measured directly
(vocab size vs. sequence length) at five BPE merge budgets, honestly noting that word-level
beats every BPE budget tested on this tiny, closed corpus and explaining why that reverses at
production scale. `google/bert_uncased_L-2_H-128_A-2`'s real pretrained embeddings are
projected to 2D via from-scratch PCA; curated category words cluster with a 6.2x
between/within distance ratio. Added `transformers`/`tokenizers` to the worktree venv
(already declared in requirements.txt).

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
