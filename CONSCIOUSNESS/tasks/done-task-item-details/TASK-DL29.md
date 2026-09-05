# TASK-DL29: Lesson 14a Generative Models theory

## Context
Deliverable: `notebooks/14a_generative_models_theory.ipynb` for STORY-DL15 (Generative Models). Theory: derive from first principles and implement from scratch in NumPy. Data: MNIST.

## Acceptance Criteria
- [x] **AC-1** — Presents the autoencoder and states why it is not generative on its own
- [x] **AC-2** — Derives the VAE evidence lower bound and the reparameterisation trick
- [x] **AC-3** — Derives the diffusion forward noising process and the reverse denoising objective
- [x] **AC-4** — States how VAEs, diffusion and GANs differ in what they optimise
- [x] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-7** — Contains every section listed for `14a_generative_models_theory.ipynb` in `syllabus/manifest.yaml`

## Closing note
`scripts/verify_notebook.sh` — PASS: clean execution in 36s (cap 600s), 35 cells, all 8 required headings present, no committed outputs. From-scratch NumPy autoencoder (gradient-checked) demonstrates non-generativity by decoding random bottleneck codes into non-digit noise; VAE ELBO and Gaussian KL closed form verified against Monte Carlo; reparameterisation trick's variance advantage over a score-function estimator measured directly; diffusion's closed-form forward process verified to reach N(0,I) by t=T.

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/14a_generative_models_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL15 (Generative Models)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
