# TASK-DL4: Lesson 1b From Linear Models to Neurons practical

## Context
Deliverable: `notebooks/1b_linear_to_neurons_practical.ipynb` for STORY-DL2 (From Linear Models to Neurons). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: MNIST.

## Acceptance Criteria
- [x] **AC-1** — Reimplements the same model in PyTorch and confirms it matches the from-scratch version's accuracy
- [x] **AC-2** — Uses `Dataset`/`DataLoader` for mini-batching
- [x] **AC-3** — Demonstrates the overfit-one-batch sanity check and explains what its failure would indicate
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `1b_linear_to_neurons_practical.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/1b_linear_to_neurons_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL3
- Story: STORY-DL2 (From Linear Models to Neurons)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)

## Closing Note
`scripts/verify_notebook.sh notebooks/1b_linear_to_neurons_practical.ipynb` → `PASS: 1b_linear_to_neurons_practical.ipynb — clean execution in 68s (cap 600s)`.
NumPy-from-scratch baseline (1a's model, retrained on MNIST 0-vs-1 pixels) reached train/test accuracy 99.7%/100.0%; the PyTorch reimplementation (`nn.Linear` + `BCEWithLogitsLoss`, `Dataset`/`DataLoader` mini-batching) reached 100.0%/100.0% — a 0.0% test accuracy gap, well within the notebook's asserted <5% bound. Overfit-one-batch check drove loss to 0.0032 (< 1e-2 threshold) and accuracy to 100% on a fixed 24-example batch within 300 steps.
