# TASK-DL046: Fix diffusion noise schedule not reaching near-zero alpha_bar in Lesson 14

## Context

Rejected at review (AC-3). 14a's forward-process schedule (betas=linspace(1e-4,0.02,T)) gives alpha_bar[-1]=0.132 at T=200, and 14b's identical betas at T=100 give alpha_bar[-1]=0.364 -- neither is close to 0, contradicting the notebook's own claim (14a cell 26/27) that x_T is 'pure noise, entirely independent of x0'. sqrt(alpha_bar) is 36% (14a) / 60% (14b) retained signal amplitude at the final forward step. 14b's reverse sampling starts from true N(0,I) (torch.randn) while the model trains against a forward endpoint that materially differs from N(0,I) near t=T -- an unaddressed train/inference mismatch (AC-6 knock-on). Fix: either increase T or rescale the beta schedule so alpha_bar_T is genuinely close to zero (e.g. <1e-3 -- the standard DDPM schedule uses this same beta range but T=1000, not 100-200), re-verify the alpha_bar/x_T-vs-noise check in 14a numerically actually supports the 'entirely independent of x0' claim, and update 14b's diffusion training/sampling to use the corrected schedule. Re-run scripts/verify_notebook.sh on both notebooks after the fix.

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
