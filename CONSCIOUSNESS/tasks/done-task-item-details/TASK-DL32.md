# TASK-DL32: Lesson 15b Efficient and Scalable Deep Learning practical

## Context
Deliverable: `notebooks/15b_efficient_scalable_practical.ipynb` for STORY-DL16 (Efficient and Scalable Deep Learning). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: CIFAR-10 subset.

## Acceptance Criteria
- [x] **AC-1** — Trains with automatic mixed precision and reports the speed and memory difference against full precision
- [x] **AC-2** — Applies dynamic quantisation to a trained model and reports size, latency and accuracy change
- [x] **AC-3** — Distils a small CNN from a larger one and compares accuracy against training the small model directly
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `15b_efficient_scalable_practical.ipynb` in `syllabus/manifest.yaml`

## Closing Note
`scripts/verify_notebook.sh notebooks/15b_efficient_scalable_practical.ipynb` — PASS, clean execution in 46s
(cap 600s), 28 cells, all 7 required headings present, no error outputs. All three techniques measured with
real numbers on this CPU, not asserted: `torch.autocast` bf16 gave an unconditional 2x activation-memory
reduction but was measurably *slower* per step (no native low-precision matrix unit on this hardware);
`torch.quantization.quantize_dynamic` cost no measurable accuracy and reduced state_dict size, but was also
slower at inference (quantize/dequantize overhead exceeds the saved arithmetic at this model/batch size);
distillation (real training loop, 5 seeds) did not show a clean accuracy win over direct training, reported
honestly, consistent with 15a's finding that its loss reliably improves teacher-agreement rather than
guaranteeing an accuracy win. A "Measurements" table collects every before/after number in one place.

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/15b_efficient_scalable_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL31
- Story: STORY-DL16 (Efficient and Scalable Deep Learning)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
