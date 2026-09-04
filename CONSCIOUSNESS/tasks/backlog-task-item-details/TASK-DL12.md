# TASK-DL12: Lesson 5b Convolutional Networks practical

## Context
Deliverable: `notebooks/5b_convolutional_networks_practical.ipynb` for STORY-DL6 (Convolutional Networks). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: MNIST, CIFAR-10.

## Acceptance Criteria
- [ ] **AC-1** — Builds and trains a CNN on CIFAR-10 in PyTorch and reports test accuracy above a stated dense-network baseline
- [ ] **AC-2** — Visualises first-layer filters and intermediate feature maps
- [ ] **AC-3** — Compares pooling strategies
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `5b_convolutional_networks_practical.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/5b_convolutional_networks_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL11
- Story: STORY-DL6 (Convolutional Networks)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
