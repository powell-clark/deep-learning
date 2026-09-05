# TASK-DL12: Lesson 5b Convolutional Networks practical

## Context
Deliverable: `notebooks/5b_convolutional_networks_practical.ipynb` for STORY-DL6 (Convolutional Networks). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: MNIST, CIFAR-10.

## Acceptance Criteria
- [x] **AC-1** — Builds and trains a CNN on CIFAR-10 in PyTorch and reports test accuracy above a stated dense-network baseline
- [x] **AC-2** — Visualises first-layer filters and intermediate feature maps
- [x] **AC-3** — Compares pooling strategies
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `5b_convolutional_networks_practical.ipynb` in `syllabus/manifest.yaml`

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

## Closing Note
CNN (nn.Conv2d + nn.MaxPool2d) trained on CIFAR-10 beats a measured dense-MLP baseline on
identical data; max vs average pooling compared under identical training; first-layer filters
and their feature maps on a real image visualised. Device pinned to CPU explicitly (not
"cuda if available") after this environment's GPU surfaced a broken cuDNN install
(CUDNN_STATUS_SUBLIBRARY_VERSION_MISMATCH on the first Conv2d call, while plain nn.Linear
notebooks never hit it because those use cuBLAS, not cuDNN) — CPU-pinning is also what the
task's own runtime requirement calls for. `scripts/verify_notebook.sh
notebooks/5b_convolutional_networks_practical.ipynb` — PASS: clean execution in 46s (cap 600s),
26 cells, 6/6 required headings present, no committed outputs.
