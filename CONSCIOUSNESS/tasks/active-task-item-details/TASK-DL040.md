# TASK-DL040: Add pip install cell to 8b tokenisation notebook

## Context

Rejected at review (FEAT-DL1, AC-2). notebooks/8b_embeddings_tokenisation_practical.ipynb imports 'tokenizers' (cell 11) and 'transformers' (cell 19) with no in-notebook pip install; both packages are not preinstalled on Colab, so a fresh Colab runtime raises ModuleNotFoundError. Add a leading '!pip install -q tokenizers transformers' cell (matching the pattern already used in notebooks/12b_finetuning_adaptation_practical.ipynb) before the first import of either package.

## Acceptance criteria

- [ ] _(to be filled in)_

## Dependencies

- Directive: DIRECT-DL1
- Story: STORY-DL9
- Features: FEAT-DL1

## Pre-mortem

### Failure modes

- _(to be filled in)_

### Weak assumptions

- _(to be filled in)_
