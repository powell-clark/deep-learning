# TASK-DL19: Lesson 9a Attention theory

## Context
Deliverable: `notebooks/9a_attention_theory.ipynb` for STORY-DL10 (Attention). Theory: derive from first principles and implement from scratch in NumPy. Data: Synthetic.

## Acceptance Criteria
- [ ] **AC-1** — States the alignment problem that fixed-size encodings create
- [ ] **AC-2** — Derives additive and scaled dot-product attention, and explains why the scaling factor is the square root of the key dimension
- [ ] **AC-3** — Frames attention as a differentiable soft dictionary lookup over keys and values
- [ ] **AC-4** — Implements scaled dot-product attention in NumPy and verifies it against a PyTorch reference
- [ ] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-7** — Contains every section listed for `9a_attention_theory.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/9a_attention_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL10 (Attention)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
