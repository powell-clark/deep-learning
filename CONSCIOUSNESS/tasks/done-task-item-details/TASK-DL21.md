# TASK-DL21: Lesson 10a The Transformer theory

## Context
Deliverable: `notebooks/10a_the_transformer_theory.ipynb` for STORY-DL11 (The Transformer). Theory: derive from first principles and implement from scratch in NumPy. Data: Synthetic / tiny text.

## Acceptance Criteria
- [x] **AC-1** — Derives multi-head attention and explains what multiple heads add over one
- [x] **AC-2** — Explains sinusoidal and learned positional encodings and why position must be injected at all
- [x] **AC-3** — Explains causal masking and shows the mask matrix
- [x] **AC-4** — Counts the parameters of a transformer block analytically and confirms against the implementation
- [x] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-7** — Contains every section listed for `10a_the_transformer_theory.ipynb` in `syllabus/manifest.yaml`

## Closing Note
`scripts/verify_notebook.sh notebooks/10a_the_transformer_theory.ipynb` → `PASS: 10a_the_transformer_theory.ipynb — clean execution in 7s (cap 600s)`.
From-scratch multi-head attention matches a batched `scaled_dot_product_attention` reference
to 2e-17. Permutation-equivariance is measured exactly: permuting inputs without positional
encoding reproduces the permuted output to 7e-18, and adding sinusoidal positional encoding
breaks that equivariance (4.5e-3 gap). Causal masking is verified directly: perturbing the
final token changes zero earlier-position outputs with the mask (exactly 0.0) vs 9.1e-2
without it. The hand-derived parameter-count formula matches a real `torch.nn` Transformer
block exactly (8544 == 8544).

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/10a_the_transformer_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL11 (The Transformer)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
