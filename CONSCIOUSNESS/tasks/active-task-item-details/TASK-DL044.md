# TASK-DL044: Fix mismatched fine-tuning budget in 6b

## Context

Rejected at review (AC-6). 6b_modern_architectures_practical.ipynb trains feature extraction for 12 epochs (cell 12) but both fine-tuning runs for only 8 epochs (cell 15), on the same 800-image loader -- so the cell-18 bar-chart comparison of feature extraction vs. full fine-tuning does not share a training budget as AC-6 requires. Fix by training all three (feature extraction, fine-tune low-lr, fine-tune high-lr) for the same number of epochs, then re-run scripts/verify_notebook.sh and re-check the comparison narrative in cells 16 and 19 still holds at the corrected epoch count.

## Acceptance criteria

- [ ] _(to be filled in)_

## Dependencies

- Directive: DIRECT-DL1
- Story: STORY-DL7
- Features: FEAT-DL10

## Pre-mortem

### Failure modes

- _(to be filled in)_

### Weak assumptions

- _(to be filled in)_
