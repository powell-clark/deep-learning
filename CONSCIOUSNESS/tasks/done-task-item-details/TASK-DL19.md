# TASK-DL19: Lesson 9a Attention theory

## Context
Deliverable: `notebooks/9a_attention_theory.ipynb` for STORY-DL10 (Attention). Theory: derive from first principles and implement from scratch in NumPy. Data: Synthetic.

## Acceptance Criteria
- [x] **AC-1** — States the alignment problem that fixed-size encodings create
- [x] **AC-2** — Derives additive and scaled dot-product attention, and explains why the scaling factor is the square root of the key dimension
- [x] **AC-3** — Frames attention as a differentiable soft dictionary lookup over keys and values
- [x] **AC-4** — Implements scaled dot-product attention in NumPy and verifies it against a PyTorch reference
- [x] **AC-5** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-6** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-7** — Contains every section listed for `9a_attention_theory.ipynb` in `syllabus/manifest.yaml`

## Closing Note
`scripts/verify_notebook.sh notebooks/9a_attention_theory.ipynb` → `PASS: 9a_attention_theory.ipynb — clean execution in 7s (cap 600s)`.
The alignment problem is motivated by reusing 7a's own Jacobian-product argument to measure
an early hidden state's influence on the final one collapsing from 0.16 to 5e-13 over 60
steps. The 1/sqrt(d_k) scaling is verified by measuring unscaled dot-product variance growing
linearly with d_k and unscaled softmax entropy collapsing toward zero. The soft-lookup section
shows a near-exact query concentrating >99% weight on its matching key/value, and a
query placed between two keys splitting the great majority of its weight between just those
two. From-scratch scaled dot-product attention matches
`torch.nn.functional.scaled_dot_product_attention` to floating-point precision (max diff
4.44e-16).

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/9a_attention_theory.ipynb
```

## Dependencies
- Blocked by: none
- Story: STORY-DL10 (Attention)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
