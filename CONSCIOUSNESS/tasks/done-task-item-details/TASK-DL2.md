# TASK-DL2: Lesson 0b Introduction to Deep Learning practical

## Context
Deliverable: `notebooks/0b_intro_deep_learning_practical.ipynb` for STORY-DL1 (Introduction to Deep Learning). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: FashionMNIST.

## Acceptance Criteria
- [x] **AC-1** — Introduces PyTorch tensors, autograd and `nn.Module` with the minimal training-loop skeleton reused in later lessons
- [x] **AC-2** — Trains a small network on FashionMNIST and reports test accuracy
- [x] **AC-3** — Includes a Colab device check that selects GPU when present and falls back to CPU
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `0b_intro_deep_learning_practical.ipynb` in `syllabus/manifest.yaml`

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

## Closing Note
`notebooks/0b_intro_deep_learning_practical.ipynb` built via nbformat (27 cells, clean
`outputs: []` / `execution_count: null`). Reuses lesson 0a's "why depth matters" framing,
then swaps hand-derived NumPy weights for PyTorch tensors/autograd/`nn.Module` and a
generic `train_one_epoch` / `evaluate` training-loop skeleton. Trains a 2-hidden-layer MLP
(128→64) on a 4,000-image FashionMNIST training subsample (1,000 held-out test images) for
3 epochs, capped by `torch.utils.data.Subset`.

Verifier: `scripts/verify_notebook.sh notebooks/0b_intro_deep_learning_practical.ipynb` →
`PASS: 0b_intro_deep_learning_practical.ipynb — clean execution in 9s (cap 600s)`.

Achieved test accuracy: 77.9% on the 1,000-image held-out subset (vs. 10% random-guess
baseline across 10 balanced classes).
