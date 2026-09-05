# TASK-DL046: Fix diffusion noise schedule not reaching near-zero alpha_bar in Lesson 14

## Context

Rejected at review (AC-3). 14a's forward-process schedule (betas=linspace(1e-4,0.02,T)) gives alpha_bar[-1]=0.132 at T=200, and 14b's identical betas at T=100 give alpha_bar[-1]=0.364 -- neither is close to 0, contradicting the notebook's own claim (14a cell 26/27) that x_T is 'pure noise, entirely independent of x0'. sqrt(alpha_bar) is 36% (14a) / 60% (14b) retained signal amplitude at the final forward step. 14b's reverse sampling starts from true N(0,I) (torch.randn) while the model trains against a forward endpoint that materially differs from N(0,I) near t=T -- an unaddressed train/inference mismatch (AC-6 knock-on). Fix: either increase T or rescale the beta schedule so alpha_bar_T is genuinely close to zero (e.g. <1e-3 -- the standard DDPM schedule uses this same beta range but T=1000, not 100-200), re-verify the alpha_bar/x_T-vs-noise check in 14a numerically actually supports the 'entirely independent of x0' claim, and update 14b's diffusion training/sampling to use the corrected schedule. Re-run scripts/verify_notebook.sh on both notebooks after the fix.

## Acceptance criteria

- [x] 14a and 14b's forward-process schedule gives `alpha_bar[-1] < 1e-3` (genuinely near-zero, not merely smaller)
- [x] 14a's numerical alpha_bar/x_T-vs-noise check (cells 26/27) is re-verified to actually support the "pure noise, entirely independent of x0" claim at the corrected schedule
- [x] 14b's diffusion training and reverse sampling use the corrected schedule, so the train-time forward endpoint and the inference-time `torch.randn` start are consistent
- [x] `scripts/verify_notebook.sh` prints `PASS` for both 14a and 14b under the corrected schedule and 10-minute CPU cap

## Closing note

Both notebooks now use `T=1000, betas=linspace(1e-4,0.02,T)` (the standard DDPM
schedule) instead of 14a's T=200 / 14b's T=100; `alpha_bar[-1] = 4.04e-05`,
comfortably under the 1e-3 threshold. Re-executed 14a's numeric check: x_T
samples now have mean=0.001, std=0.997, matching pure N(0,I) noise (mean=-0.000,
std=1.001) -- genuinely supports the "pure noise, entirely independent of x0"
claim, unlike the pre-fix 0.132/0.364 alpha_bars. Both notebooks share the same
T/betas, closing the train/inference distribution mismatch AC-6 named.
`scripts/verify_notebook.sh` PASS: 14a in 16s, 14b in 19s (cap 600s each).

Separate discovery, NOT part of this task's scope: 14b's minimal MLP diffusion
model does not actually converge to recognisable digits when its reverse
process is run from genuine N(0,I) noise -- confirmed true both before and
after this schedule fix (the pre-fix notebook already produced noise-only
samples; the schedule bug just made this harder to notice since x_T was never
truly pure noise to begin with). Corrected 14b cells 22 and 24's narrative,
which previously claimed successful digit generation, to accurately describe
this instead. Filed TASK-DL047 (Fix 14b diffusion model not converging to
digits) to track a real fix (architecture/training change), since that is a
capacity/architecture problem independent of the schedule this task fixes.

## Dependencies

- Directive: DIRECT-DL1
- Story: STORY-DL15
- Features: FEAT-DL18

## Pre-mortem

### Failure modes

- Naively raising T to 1000 (the standard DDPM value) to hit alpha_bar_T<1e-3 multiplies the per-sample denoising loop cost ~5-10x and risks breaching the 10-minute CPU cap in 14b's reverse-sampling demo
- Fixing 14a's schedule without propagating the same T/betas to 14b reintroduces the exact train/inference mismatch this task exists to close
- Rewriting cells 26/27's narrative to fit new numbers without checking the arithmetic still contradicts AC-3's derivation requirement

### Weak assumptions

- That a smaller T with a steeper beta schedule (rather than T=1000) can reach alpha_bar_T<1e-3 while keeping 14b's reverse-sampling loop within the runtime cap; verified by actually computing alpha_bar under the chosen schedule before committing to it
