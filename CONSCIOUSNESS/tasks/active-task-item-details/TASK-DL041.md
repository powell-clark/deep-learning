# TASK-DL041: Add pip install cell to 11b pretraining notebook

## Context

Rejected at review (FEAT-DL1, AC-2). notebooks/11b_lm_pretraining_practical.ipynb imports 'transformers' (cell 17, AutoModelForCausalLM/AutoTokenizer for distilgpt2) with no in-notebook pip install; the package is not preinstalled on Colab, so a fresh Colab runtime raises ModuleNotFoundError. Add a leading '!pip install -q transformers' cell (matching the pattern already used in notebooks/12b_finetuning_adaptation_practical.ipynb) before the import.

## Acceptance criteria

- [ ] _(to be filled in)_

## Dependencies

- Directive: DIRECT-DL1
- Story: STORY-DL12
- Features: FEAT-DL1

## Pre-mortem

### Failure modes

- _(to be filled in)_

### Weak assumptions

- _(to be filled in)_
