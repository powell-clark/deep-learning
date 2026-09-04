# TASK-DL35: X3 Deployment and Safety notebook

## Context
Deliverable: `notebooks/X3_deployment_safety.ipynb` for STORY-DL17 (Professional Practice Series). Cross-cutting practitioner skill, independent of any single architecture.

## Acceptance Criteria
- [ ] **AC-1** — Exports a trained model with TorchScript or ONNX and runs inference from the exported artefact
- [ ] **AC-2** — Measures latency and throughput and explains the batching trade-off
- [ ] **AC-3** — Covers monitoring and distribution drift with a worked drift signal
- [ ] **AC-4** — Tests robustness against corrupted or shifted inputs
- [ ] **AC-5** — Covers responsible-use considerations: documented limitations, failure modes and misuse risks
- [ ] **AC-6** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [ ] **AC-7** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [ ] **AC-8** — Contains every section listed for `X3_deployment_safety.ipynb` in `syllabus/manifest.yaml`

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/X3_deployment_safety.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL17 (Professional Practice Series)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
