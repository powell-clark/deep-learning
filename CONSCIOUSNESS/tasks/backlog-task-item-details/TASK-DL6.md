# TASK-DL6: Lesson 2b Multilayer Perceptrons and Backpropagation practical

## Context
Deliverable: `notebooks/2b_mlp_backprop_practical.ipynb` for STORY-DL3 (Multilayer Perceptrons and Backpropagation). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: MNIST subset.

## Acceptance Criteria
- [ ] **AC-1** — Builds the equivalent PyTorch MLP and confirms autograd gradients match the manual ones to tolerance
- [ ] **AC-2** — Uses a backward hook to inspect per-layer gradient magnitudes
- [ ] **AC-3** — Trains on an MNIST subset and reports accuracy
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `2b_mlp_backprop_practical.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/2b_mlp_backprop_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL5
- Story: STORY-DL3 (Multilayer Perceptrons and Backpropagation)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
