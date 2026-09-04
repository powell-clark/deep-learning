# TASK-DL3: Lesson 1a From Linear Models to Neurons theory

## Context
Deliverable: `notebooks/1a_linear_to_neurons_theory.ipynb` for STORY-DL2 (From Linear Models to Neurons). Theory: derive from first principles and implement from scratch in NumPy. Data: MNIST.

## Acceptance Criteria
- [ ] **AC-1** — Derives logistic regression as a single-neuron network, stating the loss and its gradient
- [ ] **AC-2** — Compares batch, mini-batch and stochastic gradient descent on the same objective with a convergence plot
- [ ] **AC-3** — Shows empirically how the learning rate changes convergence, including a divergent case
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `1a_linear_to_neurons_theory.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/1a_linear_to_neurons_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL2 (From Linear Models to Neurons)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
