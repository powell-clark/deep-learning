# TASK-DL9: Lesson 4a Regularisation and Generalisation theory

## Context
Deliverable: `notebooks/4a_regularisation_theory.ipynb` for STORY-DL5 (Regularisation and Generalisation). Theory: derive from first principles and implement from scratch in NumPy. Data: CIFAR-10 subset.

## Acceptance Criteria
- [ ] **AC-1** — Frames bias-variance for over-parameterised networks and notes where the classical picture breaks
- [ ] **AC-2** — Shows weight decay is equivalent to L2 regularisation for plain SGD and states where the equivalence fails
- [ ] **AC-3** — Derives dropout as an implicit ensemble and states the train/test scaling rule
- [ ] **AC-4** — Explains double descent with a reproduced test-error curve
- [ ] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-7** — Contains every section listed for `4a_regularisation_theory.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/4a_regularisation_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL5 (Regularisation and Generalisation)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
