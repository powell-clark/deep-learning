# TASK-DL28: Lesson 13b Alignment: RLHF and Preference Optimisation practical

## Context
Deliverable: `notebooks/13b_alignment_rlhf_practical.ipynb` for STORY-DL14 (Alignment: RLHF and Preference Optimisation). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Tiny preference set.

## Acceptance Criteria
- [ ] **AC-1** — Trains a small reward model on a tiny preference set and reports pairwise accuracy
- [ ] **AC-2** — Runs DPO on a small language model and shows before/after generations on held-out prompts
- [ ] **AC-3** — Discusses at least one documented failure mode such as reward hacking or over-optimisation
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `13b_alignment_rlhf_practical.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/13b_alignment_rlhf_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL27
- Story: STORY-DL14 (Alignment: RLHF and Preference Optimisation)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
