# TASK-DL25: Lesson 12a Fine-tuning and Adaptation theory

## Context
Deliverable: `notebooks/12a_finetuning_adaptation_theory.ipynb` for STORY-DL13 (Fine-tuning and Adaptation). Theory: derive from first principles and implement from scratch in NumPy. Data: Small sentiment subset.

## Acceptance Criteria
- [ ] **AC-1** — Compares full fine-tuning, feature extraction and prompting, stating when each is appropriate
- [ ] **AC-2** — Derives the LoRA low-rank update and counts the parameters it trains against full fine-tuning
- [ ] **AC-3** — Explains catastrophic forgetting and at least one mitigation
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `12a_finetuning_adaptation_theory.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/12a_finetuning_adaptation_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL13 (Fine-tuning and Adaptation)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
