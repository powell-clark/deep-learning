# TASK-DL21: Lesson 10a The Transformer theory

## Context
Deliverable: `notebooks/10a_the_transformer_theory.ipynb` for STORY-DL11 (The Transformer). Theory: derive from first principles and implement from scratch in NumPy. Data: Synthetic / tiny text.

## Acceptance Criteria
- [ ] **AC-1** — Derives multi-head attention and explains what multiple heads add over one
- [ ] **AC-2** — Explains sinusoidal and learned positional encodings and why position must be injected at all
- [ ] **AC-3** — Explains causal masking and shows the mask matrix
- [ ] **AC-4** — Counts the parameters of a transformer block analytically and confirms against the implementation
- [ ] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-7** — Contains every section listed for `10a_the_transformer_theory.ipynb` in `syllabus/manifest.yaml`

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
