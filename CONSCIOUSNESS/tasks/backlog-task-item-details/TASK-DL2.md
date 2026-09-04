# TASK-DL2: Lesson 0b Introduction to Deep Learning practical

## Context
Deliverable: `notebooks/0b_intro_deep_learning_practical.ipynb` for STORY-DL1 (Introduction to Deep Learning). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: FashionMNIST.

## Acceptance Criteria
- [ ] **AC-1** — Introduces PyTorch tensors, autograd and `nn.Module` with the minimal training-loop skeleton reused in later lessons
- [ ] **AC-2** — Trains a small network on FashionMNIST and reports test accuracy
- [ ] **AC-3** — Includes a Colab device check that selects GPU when present and falls back to CPU
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `0b_intro_deep_learning_practical.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/0b_intro_deep_learning_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL1
- Story: STORY-DL1 (Introduction to Deep Learning)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
