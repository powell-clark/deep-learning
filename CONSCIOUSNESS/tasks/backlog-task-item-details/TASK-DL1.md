# TASK-DL1: Lesson 0a Introduction to Deep Learning theory

## Context
Deliverable: `notebooks/0a_intro_deep_learning_theory.ipynb` for STORY-DL1 (Introduction to Deep Learning). Theory: derive from first principles and implement from scratch in NumPy. Data: FashionMNIST.

## Acceptance Criteria
- [ ] **AC-1** — Explains what stacking non-linear layers buys over a linear model, with a worked example a linear model provably cannot fit
- [ ] **AC-2** — Defines the computational graph and forward pass notation used throughout the curriculum
- [ ] **AC-3** — Implements a forward-only two-layer network in NumPy and shows its decision boundary
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `0a_intro_deep_learning_theory.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/0a_intro_deep_learning_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL1 (Introduction to Deep Learning)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
