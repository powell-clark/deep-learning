# TASK-DL14: Lesson 6b Modern Architectures and Transfer Learning practical

## Context
Deliverable: `notebooks/6b_modern_architectures_practical.ipynb` for STORY-DL7 (Modern Architectures and Transfer Learning). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Small image set.

## Acceptance Criteria
- [x] **AC-1** — Fine-tunes a pretrained torchvision ResNet on a small image set and reports accuracy
- [x] **AC-2** — Compares full fine-tuning against frozen-feature extraction on the same data and budget
- [x] **AC-3** — Shows the effect of the learning rate on fine-tuning stability
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `6b_modern_architectures_practical.ipynb` in `syllabus/manifest.yaml`

## Closing note
`scripts/verify_notebook.sh` — PASS: clean execution in 58s (cap 600s), 22 cells, all 7 required headings present, no committed outputs. Compares frozen-feature-extraction vs. full fine-tuning at a low and a high learning rate on a pretrained resnet18 over a CIFAR-10 subset.

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/6b_modern_architectures_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL13
- Story: STORY-DL7 (Modern Architectures and Transfer Learning)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
