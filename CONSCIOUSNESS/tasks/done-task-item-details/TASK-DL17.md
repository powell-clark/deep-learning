# TASK-DL17: Lesson 8a Embeddings and Tokenisation theory

## Context
Deliverable: `notebooks/8a_embeddings_tokenisation_theory.ipynb` for STORY-DL9 (Embeddings and Tokenisation). Theory: derive from first principles and implement from scratch in NumPy. Data: Small corpus.

## Acceptance Criteria
- [x] **AC-1** — States the distributional hypothesis and what an embedding is
- [x] **AC-2** — Derives skip-gram with negative sampling, giving the objective and its gradient
- [x] **AC-3** — Trains embeddings from scratch in NumPy on a small corpus and shows nearest neighbours
- [x] **AC-4** — Examines embedding geometry, including at least one analogy and one failure case
- [x] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-7** — Contains every section listed for `8a_embeddings_tokenisation_theory.ipynb` in `syllabus/manifest.yaml`

## Closing Note
`scripts/verify_notebook.sh notebooks/8a_embeddings_tokenisation_theory.ipynb` → `PASS: 8a_embeddings_tokenisation_theory.ipynb — clean execution in 149s (cap 600s)`.
SGNS loss and its closed-form gradient are verified against torch autograd to floating-point
precision. Embeddings are trained from scratch in NumPy on a small, deliberately structured
corpus; mean-centering removes the dominant shared direction before cosine comparisons (a
real, documented technique), after which `man`/`woman` recover clean nearest neighbours
(`boy`/`girl`, both >0.9 cosine) and `king - man + woman` resolves to `queen`/`princess`. The
corpus's one word occurring only once (`wizard`) gives a genuine, measured failure case: its
best cosine similarity to anything is far below the frequent words', and its top match isn't
even a word it actually appeared alongside.

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/8a_embeddings_tokenisation_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL9 (Embeddings and Tokenisation)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
