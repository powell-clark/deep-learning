# TASK-DL7: Lesson 3a Training Dynamics theory

## Context
Deliverable: `notebooks/3a_training_dynamics_theory.ipynb` for STORY-DL4 (Training Dynamics). Theory: derive from first principles and implement from scratch in NumPy. Data: CIFAR-10 subset.

## Acceptance Criteria
- [ ] **AC-1** — Derives Xavier and He initialisation from variance-preservation arguments
- [ ] **AC-2** — Demonstrates vanishing and exploding gradients empirically with per-layer gradient norms
- [ ] **AC-3** — Derives BatchNorm and LayerNorm, stating what each normalises over and when each applies
- [ ] **AC-4** — Derives momentum, RMSProp and Adam as successive modifications to the SGD update
- [ ] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-7** — Contains every section listed for `3a_training_dynamics_theory.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/3a_training_dynamics_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL4 (Training Dynamics)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
