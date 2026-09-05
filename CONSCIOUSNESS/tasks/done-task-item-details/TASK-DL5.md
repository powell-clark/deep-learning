# TASK-DL5: Lesson 2a Multilayer Perceptrons and Backpropagation theory

## Context
Deliverable: `notebooks/2a_mlp_backprop_theory.ipynb` for STORY-DL3 (Multilayer Perceptrons and Backpropagation). Theory: derive from first principles and implement from scratch in NumPy. Data: MNIST subset.

## Acceptance Criteria
- [x] **AC-1** — Derives the backward pass for an L-layer MLP from the chain rule, giving the gradient for each parameter
- [x] **AC-2** — Implements forward and backward passes in NumPy with no autograd
- [x] **AC-3** — Verifies the analytic gradients against numerical finite differences and reports the maximum relative error
- [x] **AC-4** — Compares sigmoid, tanh and ReLU with their derivatives and explains saturation
- [x] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-7** — Contains every section listed for `2a_mlp_backprop_theory.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/2a_mlp_backprop_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL3 (Multilayer Perceptrons and Backpropagation)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)

## Closing Note
`scripts/verify_notebook.sh notebooks/2a_mlp_backprop_theory.ipynb` → `PASS: 2a_mlp_backprop_theory.ipynb — clean execution in 10s (cap 600s)`.
Gradient check (tanh toy MLP, 30 sampled parameters across all layers, central difference eps=1e-5): max relative error 1.406e-09. From-scratch ReLU MLP ([784,64,32,10]) trained on an MNIST subset reached final train accuracy 1.000 and test accuracy 0.915.
