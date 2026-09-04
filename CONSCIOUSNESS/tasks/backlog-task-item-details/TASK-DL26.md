# TASK-DL26: Lesson 12b Fine-tuning and Adaptation practical

## Context
Deliverable: `notebooks/12b_finetuning_adaptation_practical.ipynb` for STORY-DL13 (Fine-tuning and Adaptation). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Small sentiment subset.

## Acceptance Criteria
- [ ] **AC-1** — Fine-tunes a small Hugging Face encoder for sentiment and reports accuracy against a zero-shot baseline
- [ ] **AC-2** — Applies LoRA via PEFT to the same task and compares accuracy and trainable-parameter count
- [ ] **AC-3** — Shows the effect of the LoRA rank
- [ ] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-6** — Contains every section listed for `12b_finetuning_adaptation_practical.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/12b_finetuning_adaptation_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL25
- Story: STORY-DL13 (Fine-tuning and Adaptation)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
