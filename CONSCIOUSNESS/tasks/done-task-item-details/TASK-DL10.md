# TASK-DL10: Lesson 4b Regularisation and Generalisation practical

## Context
Deliverable: `notebooks/4b_regularisation_practical.ipynb` for STORY-DL5 (Regularisation and Generalisation). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: CIFAR-10 subset.

## Acceptance Criteria
- [x] **AC-1** — Compares augmentation pipelines and quantifies the effect on validation accuracy
- [x] **AC-2** — Runs a dropout-rate and weight-decay ablation with learning curves
- [x] **AC-3** — Implements early stopping on a validation split and shows the stopping point
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `4b_regularisation_practical.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/4b_regularisation_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL9
- Story: STORY-DL5 (Regularisation and Generalisation)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)

## Closing Note
Real train/val/test split; four `torchvision.transforms` augmentation pipelines compared on
validation accuracy; a 3x3 dropout x weight-decay ablation trained with plain SGD (exercising
4a's proven weight-decay/L2 equivalence with no adaptive-optimiser caveat); a real
patience-based early-stopping loop with checkpoint restoration; and a combined
fully-regularised-vs-baseline learning-curve comparison. `scripts/verify_notebook.sh
notebooks/4b_regularisation_practical.ipynb` — PASS: clean execution in 26s (cap 600s), 28
cells, 7/7 required headings present, no committed outputs.
