# TASK-DL5: Lesson 2a Multilayer Perceptrons and Backpropagation theory

## Context
Deliverable: `notebooks/2a_mlp_backprop_theory.ipynb` for STORY-DL3 (Multilayer Perceptrons and Backpropagation). Theory: derive from first principles and implement from scratch in NumPy. Data: MNIST subset.

## Acceptance Criteria
- [ ] **AC-1** — Derives the backward pass for an L-layer MLP from the chain rule, giving the gradient for each parameter
- [ ] **AC-2** — Implements forward and backward passes in NumPy with no autograd
- [ ] **AC-3** — Verifies the analytic gradients against numerical finite differences and reports the maximum relative error
- [ ] **AC-4** — Compares sigmoid, tanh and ReLU with their derivatives and explains saturation
- [ ] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-7** — Contains every section listed for `2a_mlp_backprop_theory.ipynb` in `syllabus/manifest.yaml`

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
