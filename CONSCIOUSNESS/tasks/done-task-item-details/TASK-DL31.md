# TASK-DL31: Lesson 15a Efficient and Scalable Deep Learning theory

## Context
Deliverable: `notebooks/15a_efficient_scalable_theory.ipynb` for STORY-DL16 (Efficient and Scalable Deep Learning). Theory: derive from first principles and implement from scratch in NumPy. Data: CIFAR-10 subset.

## Acceptance Criteria
- [x] **AC-1** — Accounts for the memory a training step uses: parameters, gradients, optimiser state and activations
- [x] **AC-2** — Explains mixed-precision training and which operations must stay in higher precision
- [x] **AC-3** — Derives int8 quantisation including the scale and zero-point, and states where accuracy is lost
- [x] **AC-4** — Explains knowledge distillation with its loss, and contrasts data and model parallelism
- [x] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-7** — Contains every section listed for `15a_efficient_scalable_theory.ipynb` in `syllabus/manifest.yaml`

## Closing Note
`scripts/verify_notebook.sh notebooks/15a_efficient_scalable_theory.ipynb` — PASS, clean execution in 91s
(cap 600s), 36 cells, all 8 required headings present, no error outputs. Memory accounting is measured via
forward hooks on a real TinyCNN (not asserted); mixed-precision underflow/loss-scaling and quantisation
scale/zero-point/outlier-error are demonstrated numerically; distillation is verified against the metric its
loss actually optimises (agreement with the teacher's output distribution, consistent across 5 seeds) rather
than an inconsistent toy-scale test-accuracy delta, reported honestly either way; the parallelism section
reuses this notebook's own memory arithmetic to show a 7B-parameter model needs >100 GB fixed training
memory, motivating model parallelism as a memory constraint.

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
