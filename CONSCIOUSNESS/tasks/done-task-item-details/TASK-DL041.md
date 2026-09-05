# TASK-DL041: Add pip install cell to 11b pretraining notebook

## Context

Rejected at review (FEAT-DL1, AC-2). notebooks/11b_lm_pretraining_practical.ipynb imports 'transformers' (cell 17, AutoModelForCausalLM/AutoTokenizer for distilgpt2) with no in-notebook pip install; the package is not preinstalled on Colab, so a fresh Colab runtime raises ModuleNotFoundError. Add a leading '!pip install -q transformers' cell (matching the pattern already used in notebooks/12b_finetuning_adaptation_practical.ipynb) before the import.

## Acceptance criteria

- [x] **AC-1** — `notebooks/11b_lm_pretraining_practical.ipynb` installs `transformers` before its first use (cell 17, `AutoModelForCausalLM`/`AutoTokenizer` for distilgpt2), guarded so a local run with the package already present does not reinstall (matching 12b's `try: import X; except ImportError: %pip install -q X` idiom)
- [x] **AC-2** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs
- [x] **AC-3** — No cell outputs committed, no other cell content changed

## Closing Note
`scripts/verify_notebook.sh notebooks/11b_lm_pretraining_practical.ipynb` — PASS, clean execution in 25s
(cap 600s). Guard added verbatim in the sibling 12b idiom (`try: import transformers; except ImportError:
%pip install -q transformers`), prepended to cell 17 with no other cell content touched.

## Dependencies

- Directive: DIRECT-DL1
- Story: STORY-DL12
- Features: FEAT-DL1

## Pre-mortem

### Failure modes

- An unconditional `!pip install` cell (rather than the guarded try/except form) would waste seconds to minutes on every local run where `requirements.txt` already installed the package — mitigated by matching 12b's guarded idiom exactly

### Weak assumptions

- Assumes the one flagged import (cell 17 `transformers`) is the only ungated third-party install missing from this notebook; scoped to exactly what review flagged
