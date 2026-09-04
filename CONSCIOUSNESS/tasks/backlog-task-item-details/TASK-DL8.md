# TASK-DL8: Lesson 3b Training Dynamics practical

## Context
Deliverable: `notebooks/3b_training_dynamics_practical.ipynb` for STORY-DL4 (Training Dynamics). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: CIFAR-10 subset.

## Acceptance Criteria
- [ ] **AC-1** — Runs an initialisation x normalisation x optimiser ablation and presents the results as a table
- [ ] **AC-2** — Implements a learning-rate finder and reads the chosen rate off the curve
- [ ] **AC-3** — Compares at least two learning-rate schedules on the same model
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `3b_training_dynamics_practical.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/3b_training_dynamics_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL7
- Story: STORY-DL4 (Training Dynamics)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
