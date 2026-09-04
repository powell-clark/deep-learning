# TASK-DL31: Lesson 15a Efficient and Scalable Deep Learning theory

## Context
Deliverable: `notebooks/15a_efficient_scalable_theory.ipynb` for STORY-DL16 (Efficient and Scalable Deep Learning). Theory: derive from first principles and implement from scratch in NumPy. Data: CIFAR-10 subset.

## Acceptance Criteria
- [ ] **AC-1** — Accounts for the memory a training step uses: parameters, gradients, optimiser state and activations
- [ ] **AC-2** — Explains mixed-precision training and which operations must stay in higher precision
- [ ] **AC-3** — Derives int8 quantisation including the scale and zero-point, and states where accuracy is lost
- [ ] **AC-4** — Explains knowledge distillation with its loss, and contrasts data and model parallelism
- [ ] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-7** — Contains every section listed for `15a_efficient_scalable_theory.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/15a_efficient_scalable_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL16 (Efficient and Scalable Deep Learning)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
