# TASK-DL35: X3 Deployment and Safety notebook

## Context
Deliverable: `notebooks/X3_deployment_safety.ipynb` for STORY-DL17 (Professional Practice Series). Cross-cutting practitioner skill, independent of any single architecture.

## Acceptance Criteria
- [x] **AC-1** — Exports a trained model with TorchScript or ONNX and runs inference from the exported artefact
- [x] **AC-2** — Measures latency and throughput and explains the batching trade-off
- [x] **AC-3** — Covers monitoring and distribution drift with a worked drift signal
- [x] **AC-4** — Tests robustness against corrupted or shifted inputs
- [x] **AC-5** — Covers responsible-use considerations: documented limitations, failure modes and misuse risks
- [x] **AC-6** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-7** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-8** — Contains every section listed for `X3_deployment_safety.ipynb` in `syllabus/manifest.yaml`

## Closing Note
`scripts/verify_notebook.sh notebooks/X3_deployment_safety.ipynb` → `PASS:
X3_deployment_safety.ipynb — clean execution in 10s (cap 600s)`. TorchScript export matches
the original model exactly (0.00e+00 diff). Latency/throughput measured across five batch
sizes shows throughput peaking then declining at the largest batch tested — the notebook
reports this honestly (a measured hardware-dependent sweet spot, not "bigger is always
better") rather than the initially assumed monotonic-throughput claim. A confidence-based
drift signal correctly flags every window from the exact point a simulated rotation shift
begins (6/12 windows, first flagged at window 6). Robustness testing finds accuracy falling
from 91.5% to 19.7% under increasing noise, plus a concrete confidently-wrong prediction
(90.3% confidence) at high corruption. Responsible-use section documents the model's training
scope, both measured failure modes, and misuse risk.

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
