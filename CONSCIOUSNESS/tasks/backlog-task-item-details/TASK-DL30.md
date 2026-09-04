# TASK-DL30: Lesson 14b Generative Models practical

## Context
Deliverable: `notebooks/14b_generative_models_practical.ipynb` for STORY-DL15 (Generative Models). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: MNIST.

## Acceptance Criteria
- [ ] **AC-1** — Trains a VAE on MNIST and shows reconstructions and samples from the prior
- [ ] **AC-2** — Trains a minimal diffusion model and shows the reverse process across timesteps
- [ ] **AC-3** — Compares sample quality and training stability between the two
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `14b_generative_models_practical.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/14b_generative_models_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL29
- Story: STORY-DL15 (Generative Models)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
