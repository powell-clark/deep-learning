# TASK-DL047: Fix 14b diffusion model not converging to digits

## Context

Discovered while fixing TASK-DL046 (schedule/alpha_bar correction). Independent of the schedule bug: 14b's minimal MLP diffusion model (DenoiseNet, 2-3 hidden layers, up to 512 units, sinusoidal or lookup timestep embedding) reduces L_simple during training but its ancestral reverse-sampling from genuine x_T ~ N(0,I) never converges to recognisable digits -- confirmed both before and after the alpha_bar fix, with plain lookup and sinusoidal timestep embeddings, at 150/300/1500/2000 epochs, and with both beta_t-variance and posterior-variance/clipped-x0 ancestral samplers. Per-timestep-bucket loss is measurably WORSE at low noise (t in [0,50): mse=0.96) than at high noise (t in [700,1000): mse=0.72) -- backwards from a working denoiser, because eps-prediction error at low t is x0-reconstruction error amplified by 1/sqrt(1-alpha_bar_t). A plain MLP with no convolutional structure appears not to reach the precision this requires within a CPU-feasible budget; the reverse chain's 1000 steps compound rather than correct the shortfall. The notebook's narrative (cells 22 and 24) has been corrected in TASK-DL046's commit to accurately describe this instead of falsely claiming success. Fix options to explore: a small CNN/U-Net-lite denoiser instead of a flat MLP, EMA of model weights for sampling, x0-clipping (already tried, insufficient alone), min-SNR-style loss reweighting, or accepting a lower training-data noise ceiling (smaller image crop / fewer classes) so a plain MLP's capacity suffices. Re-run scripts/verify_notebook.sh after any fix, and update cells 22/24's narrative to match whatever the corrected demo actually shows.

## Acceptance criteria

- [ ] _(to be filled in)_

## Dependencies

- Directive: DIRECT-DL1
- Story: STORY-DL15
- Features: FEAT-DL18

## Pre-mortem

### Failure modes

- _(to be filled in)_

### Weak assumptions

- _(to be filled in)_
