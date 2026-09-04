# TASK-DL34: X2 Evaluation and Benchmarking notebook

## Context
Deliverable: `notebooks/X2_evaluation_benchmarking.ipynb` for STORY-DL17 (Professional Practice Series). Cross-cutting practitioner skill, independent of any single architecture.

## Acceptance Criteria
- [ ] **AC-1** — Explains train/validation/test discipline and demonstrates a leakage failure
- [ ] **AC-2** — Covers metrics beyond accuracy and when each is the right choice
- [ ] **AC-3** — Explains calibration and plots a reliability diagram
- [ ] **AC-4** — Compares two training runs with a stated statistical method rather than a single-seed comparison
- [ ] **AC-5** — Introduces language-model evaluation and its known weaknesses
- [ ] **AC-6** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-7** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-8** — Contains every section listed for `X2_evaluation_benchmarking.ipynb` in `syllabus/manifest.yaml`

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
