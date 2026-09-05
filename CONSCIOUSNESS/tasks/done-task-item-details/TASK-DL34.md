# TASK-DL34: X2 Evaluation and Benchmarking notebook

## Context
Deliverable: `notebooks/X2_evaluation_benchmarking.ipynb` for STORY-DL17 (Professional Practice Series). Cross-cutting practitioner skill, independent of any single architecture.

## Acceptance Criteria
- [x] **AC-1** — Explains train/validation/test discipline and demonstrates a leakage failure
- [x] **AC-2** — Covers metrics beyond accuracy and when each is the right choice
- [x] **AC-3** — Explains calibration and plots a reliability diagram
- [x] **AC-4** — Compares two training runs with a stated statistical method rather than a single-seed comparison
- [x] **AC-5** — Introduces language-model evaluation and its known weaknesses
- [x] **AC-6** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-7** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-8** — Contains every section listed for `X2_evaluation_benchmarking.ipynb` in `syllabus/manifest.yaml`

## Closing note
`scripts/verify_notebook.sh` — PASS: clean execution in 14s (cap 600s), 26 cells, all 8 required headings present, no committed outputs. Feature-selection leakage on pure-noise data inflates test accuracy well above chance; accuracy vs. precision/recall/F1/ROC-AUC on an imbalanced set; a reliability diagram contrasts a calibrated classifier against an artificially sharpened one; an explicit single-seed pair that favours the reliably-worse of two configurations is contrasted against an 8-seed t-test; unigram perplexity is shown to be corpus-relative via in-domain vs. out-of-domain text.

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/X2_evaluation_benchmarking.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL17 (Professional Practice Series)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
