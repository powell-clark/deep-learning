# TASK-DL26: Lesson 12b Fine-tuning and Adaptation practical

## Context
Deliverable: `notebooks/12b_finetuning_adaptation_practical.ipynb` for STORY-DL13 (Fine-tuning and Adaptation). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Small sentiment subset.

## Acceptance Criteria
- [x] **AC-1** — Fine-tunes a small Hugging Face encoder for sentiment and reports accuracy against a zero-shot baseline
- [x] **AC-2** — Applies LoRA via PEFT to the same task and compares accuracy and trainable-parameter count
- [x] **AC-3** — Shows the effect of the LoRA rank
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `12b_finetuning_adaptation_practical.ipynb` in `syllabus/manifest.yaml`

## Closing Note
`scripts/verify_notebook.sh notebooks/12b_finetuning_adaptation_practical.ipynb` — PASS, clean
execution in 48s (cap 600s). All 6 required headings present. Fine-tunes `google/bert_uncased_L-2_H-128_A-2`
(BERT-tiny, same model 8b used) on a 300-example subset of SST-2 (`SetFit/sst2`), full fine-tune
(4,386,178 params, acc 0.750) vs. PEFT LoRA at ranks 1/2/4/8/16 (0.03-0.38% of full params, acc
0.665-0.715) vs. a zero-shot MLM cloze-prompt baseline. Reports the zero-shot result honestly
rather than forcing 12a's narrative: on this tiny two-layer encoder with a fixed template, zero-shot
(0.515) was statistically indistinguishable from an untrained chance-level head (0.530) on the
200-example test set — prose interprets this as the real, low ceiling on prompting for a model
this small, not a bug.

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
