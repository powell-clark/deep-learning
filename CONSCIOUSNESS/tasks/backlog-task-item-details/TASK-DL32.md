# TASK-DL32: Lesson 15b Efficient and Scalable Deep Learning practical

## Context
Deliverable: `notebooks/15b_efficient_scalable_practical.ipynb` for STORY-DL16 (Efficient and Scalable Deep Learning). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: CIFAR-10 subset.

## Acceptance Criteria
- [ ] **AC-1** — Trains with automatic mixed precision and reports the speed and memory difference against full precision
- [ ] **AC-2** — Applies dynamic quantisation to a trained model and reports size, latency and accuracy change
- [ ] **AC-3** — Distils a small CNN from a larger one and compares accuracy against training the small model directly
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `15b_efficient_scalable_practical.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/15b_efficient_scalable_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL31
- Story: STORY-DL16 (Efficient and Scalable Deep Learning)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
