# TASK-DL6: Lesson 2b Multilayer Perceptrons and Backpropagation practical

## Context
Deliverable: `notebooks/2b_mlp_backprop_practical.ipynb` for STORY-DL3 (Multilayer Perceptrons and Backpropagation). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: MNIST subset.

## Acceptance Criteria
- [x] **AC-1** — Builds the equivalent PyTorch MLP and confirms autograd gradients match the manual ones to tolerance
- [x] **AC-2** — Uses a backward hook to inspect per-layer gradient magnitudes
- [x] **AC-3** — Trains on an MNIST subset and reports accuracy
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `2b_mlp_backprop_practical.ipynb` in `syllabus/manifest.yaml`

## Closing Note
Built `notebooks/2b_mlp_backprop_practical.ipynb`: rebuilds 2a's `[784, 64, 32, 10]`
from-scratch NumPy MLP as an `nn.Module`, copies identical He-initialised weights into
both, and confirms autograd's gradients match the manual analytic gradients (max relative
difference 3.35e-04 across all layers' weights and biases — floating-point precision only).
A `register_full_backward_hook` on each `nn.Linear` layer records per-layer gradient
magnitude during training, plotted on a log scale. Trained on a 2000-image MNIST subset
(400 test): final train accuracy 0.988, test accuracy 0.882.

Verifier:
```
== verify 2b_mlp_backprop_practical.ipynb (cap 600s)
  static ok — 31 cells, 6 required headings present
  execution ok — no error outputs
PASS: 2b_mlp_backprop_practical.ipynb — clean execution in 9s (cap 600s)
```

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
