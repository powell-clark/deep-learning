# TASK-DL27: Lesson 13a Alignment: RLHF and Preference Optimisation theory

## Context
Deliverable: `notebooks/13a_alignment_rlhf_theory.ipynb` for STORY-DL14 (Alignment: RLHF and Preference Optimisation). Theory: derive from first principles and implement from scratch in NumPy. Data: Tiny preference set.

## Acceptance Criteria
- [ ] **AC-1** — Explains why a scalar reward is learned from pairwise preferences rather than written by hand
- [ ] **AC-2** — Derives the Bradley-Terry preference model and the reward-model loss
- [ ] **AC-3** — Describes the RLHF loop end to end and names which part is the RL problem, referencing the PPO lesson of the RL series
- [ ] **AC-4** — Derives DPO and shows how it removes the explicit reward model
- [ ] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-7** — Contains every section listed for `13a_alignment_rlhf_theory.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/13a_alignment_rlhf_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL14 (Alignment: RLHF and Preference Optimisation)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
