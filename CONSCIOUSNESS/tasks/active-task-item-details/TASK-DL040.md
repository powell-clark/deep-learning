# TASK-DL040: Add pip install cell to 8b tokenisation notebook

## Context

Rejected at review (FEAT-DL1, AC-2). notebooks/8b_embeddings_tokenisation_practical.ipynb imports 'tokenizers' (cell 11) and 'transformers' (cell 19) with no in-notebook pip install; both packages are not preinstalled on Colab, so a fresh Colab runtime raises ModuleNotFoundError. Add a leading '!pip install -q tokenizers transformers' cell (matching the pattern already used in notebooks/12b_finetuning_adaptation_practical.ipynb) before the first import of either package.

## Acceptance criteria

- [ ] **AC-1** — `notebooks/8b_embeddings_tokenisation_practical.ipynb` installs `tokenizers` before its first use (cell 11) and `transformers` before its first use (cell 19), guarded so a local run with the packages already present does not reinstall (matching 12b's `try: import X; except ImportError: %pip install -q X` idiom)
- [ ] **AC-2** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs
- [ ] **AC-3** — No cell outputs committed, no other cell content changed

## Dependencies

- Directive: DIRECT-DL1
- Story: STORY-DL9
- Features: FEAT-DL1

## Pre-mortem

### Failure modes

- An unconditional `!pip install` cell (rather than the guarded try/except form) would waste seconds to minutes on every local run where `requirements.txt` already installed the package — mitigated by matching 12b's guarded idiom exactly

### Weak assumptions

- Assumes the two imports (cell 11 `tokenizers`, cell 19 `transformers`) are the only ungated third-party installs missing from this notebook; scoped to exactly what review flagged
