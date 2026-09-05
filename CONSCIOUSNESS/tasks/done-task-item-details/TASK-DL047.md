# TASK-DL047: Fix 14b diffusion model not converging to digits

## Context

Discovered while fixing TASK-DL046 (schedule/alpha_bar correction). Independent of the schedule bug: 14b's minimal MLP diffusion model (DenoiseNet, 2-3 hidden layers, up to 512 units, sinusoidal or lookup timestep embedding) reduces L_simple during training but its ancestral reverse-sampling from genuine x_T ~ N(0,I) never converges to recognisable digits -- confirmed both before and after the alpha_bar fix, with plain lookup and sinusoidal timestep embeddings, at 150/300/1500/2000 epochs, and with both beta_t-variance and posterior-variance/clipped-x0 ancestral samplers. Per-timestep-bucket loss is measurably WORSE at low noise (t in [0,50): mse=0.96) than at high noise (t in [700,1000): mse=0.72) -- backwards from a working denoiser, because eps-prediction error at low t is x0-reconstruction error amplified by 1/sqrt(1-alpha_bar_t). A plain MLP with no convolutional structure appears not to reach the precision this requires within a CPU-feasible budget; the reverse chain's 1000 steps compound rather than correct the shortfall. The notebook's narrative (cells 22 and 24) has been corrected in TASK-DL046's commit to accurately describe this instead of falsely claiming success. Fix options to explore: a small CNN/U-Net-lite denoiser instead of a flat MLP, EMA of model weights for sampling, x0-clipping (already tried, insufficient alone), min-SNR-style loss reweighting, or accepting a lower training-data noise ceiling (smaller image crop / fewer classes) so a plain MLP's capacity suffices. Re-run scripts/verify_notebook.sh after any fix, and update cells 22/24's narrative to match whatever the corrected demo actually shows.

## Acceptance criteria

- [x] 14b's diffusion denoiser is replaced with an architecture that measurably improves eps-prediction MSE over the flat-MLP baseline (0.65-0.93 final `L_simple`), verified by an actual before/after comparison
- [x] Reverse-sampled images show genuine digit-like structure (strokes/curves), verified by rendering and visually inspecting the samples, not just by a lower training loss
- [x] 14b's narrative (cells 15, 22, 24) is updated to accurately describe what the corrected demo actually shows
- [x] `scripts/verify_notebook.sh notebooks/14b_generative_models_practical.ipynb` prints `PASS` within the 600s cap

## Final verification

Replaced the flat-MLP `DenoiseNet` with `DenoiseCNN`: 3 full-resolution 3x3
conv blocks (32 channels, no downsampling), a sinusoidal timestep embedding
(replacing the lookup-table embedding so nearby timesteps share structure)
projected to a per-channel bias at each block, 23,329 params, 100 epochs.
`final L_simple: 0.0366` (was 0.65-0.93 for the MLP). Executed the full
notebook end-to-end and inspected the rendered outputs directly:
- Cell 18's reverse-process grid shows a genuine progression — pure noise at
  t=1000, structure beginning to resolve by t=200, clear stroke/curve shapes
  at t=0 — visibly demonstrating the reverse process across timesteps (AC-6).
- Cell 21's VAE-vs-diffusion comparison shows the VAE producing recognisable,
  blurry digits and the diffusion model producing real stroke structure that
  is not yet crisp digits — exactly what cells 22/24's updated narrative
  describes, so the prose now matches the evidence.
`scripts/verify_notebook.sh` PASS in 252s (cap 600s) — comfortable headroom
even with the added convolutional training cost.

## Dependencies

- Directive: DIRECT-DL1
- Story: STORY-DL15
- Features: FEAT-DL18

## Pre-mortem

### Failure modes

- Chasing crisp, fully recognisable digits from a "minimal" demo could balloon scope indefinitely; the bar is genuine visible improvement (stroke structure), not photorealism
- A deeper network (more conv layers, larger channel count) could push training time over the 600s cap once combined with the rest of the notebook (VAE training, MNIST load, sampling, plotting) -- must be checked against the full notebook run, not just the isolated training loop
- Fixing the model without re-checking cells 22/24's narrative leaves stale prose (already once corrected in TASK-DL046 to describe total failure -- now stale in the other direction)

### Weak assumptions

- That a small, full-resolution (no downsample/upsample) convolutional denoiser has enough spatial inductive bias to noticeably beat the flat MLP within a CPU-feasible epoch budget -- verified in a standalone repro (23K-param, 3-conv-block CNN, T=1000, 100 epochs, 140.7s train time) before touching the notebook: `L_simple` 0.65-0.93 (MLP) -> 0.0366 (CNN), and reverse samples show visible stroke/curve structure instead of pure noise

## Closing note

Standalone repro (outside the notebook, same data/T/schedule) confirmed a small
full-resolution CNN denoiser (3 conv blocks, 32 channels, sinusoidal timestep
embedding added as a per-channel bias, 23,329 params) trained for 100 epochs
(140.7s) drives `L_simple` from the flat MLP's 0.65-0.93 plateau down to 0.0366,
and its reverse-sampled images show genuine stroke/curve structure instead of
pure noise -- a real, substantial, honestly-reportable improvement for a
"minimal" CPU-budget diffusion demo, even though the samples are not yet
crisp, fully-formed digits.
