# TASK-DL15: Lesson 7a Sequence Models theory

## Context
Deliverable: `notebooks/7a_sequence_models_theory.ipynb` for STORY-DL8 (Sequence Models). Theory: derive from first principles and implement from scratch in NumPy. Data: Tiny text corpus.

## Acceptance Criteria
- [ ] **AC-1** — Defines the RNN recurrence and derives backpropagation through time
- [ ] **AC-2** — Shows why gradients vanish or explode over long sequences, with the Jacobian-product argument
- [ ] **AC-3** — Derives the LSTM gates and explains what each controls; states how the GRU simplifies it
- [ ] **AC-4** — Implements a character-level RNN forward and backward pass in NumPy
- [ ] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-7** — Contains every section listed for `7a_sequence_models_theory.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/7a_sequence_models_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL8 (Sequence Models)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
