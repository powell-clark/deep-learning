# TASK-DL044: Fix mismatched fine-tuning budget in 6b

## Context

Rejected at review (AC-6). 6b_modern_architectures_practical.ipynb trains feature extraction for 12 epochs (cell 12) but both fine-tuning runs for only 8 epochs (cell 15), on the same 800-image loader -- so the cell-18 bar-chart comparison of feature extraction vs. full fine-tuning does not share a training budget as AC-6 requires. Fix by training all three (feature extraction, fine-tune low-lr, fine-tune high-lr) for the same number of epochs, then re-run scripts/verify_notebook.sh and re-check the comparison narrative in cells 16 and 19 still holds at the corrected epoch count.

## Acceptance criteria

- [x] Feature extraction (cell 12) and both fine-tuning runs (cell 15) train for the same number of epochs
- [x] `scripts/verify_notebook.sh notebooks/6b_modern_architectures_practical.ipynb` prints `PASS`
- [x] The comparison narrative in cells 16 and 19 matches the accuracies actually produced at the corrected epoch count

## Closing note

Introduced a shared `EPOCHS = 8` constant (matching the prior fine-tuning budget, since
lowering feature extraction is cheaper than raising fine-tuning) and pointed all three
`train_classifier` calls at it. Verifier: `PASS: 6b_modern_architectures_practical.ipynb —
clean execution in 211s (cap 600s)`. Re-executed to confirm the narrative still holds at
the corrected budget: feature extraction 33.5%, fine-tune lr=1e-4 41.0% (beats feature
extraction, matching cell 19's first claim), fine-tune lr=5e-2 16.0% (loses badly, matching
cell 19's third claim) — no prose changes needed in cells 16 or 19.

## Dependencies

- Directive: DIRECT-DL1
- Story: STORY-DL7
- Features: FEAT-DL10

## Pre-mortem

### Failure modes

- Raising fine-tuning from 8 to 12 epochs (rather than lowering feature extraction to 8) roughly doubles fine-tuning compute and risks breaching the 10-minute CPU cap
- Narrative in cell 19 asserts "a well-tuned fine-tune can beat feature extraction" and "an ill-tuned fine-tune can lose to feature extraction" — the corrected run must actually reproduce that ordering or the prose needs rewriting to match the real numbers

### Weak assumptions

- That the relative accuracy ordering (low-lr fine-tune > feature extraction > high-lr fine-tune) is robust to the epoch count; it is re-verified by rerunning rather than assumed
