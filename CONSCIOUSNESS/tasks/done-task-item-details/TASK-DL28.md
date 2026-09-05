# TASK-DL28: Lesson 13b Alignment: RLHF and Preference Optimisation practical

## Context
Deliverable: `notebooks/13b_alignment_rlhf_practical.ipynb` for STORY-DL14 (Alignment: RLHF and Preference Optimisation). Practical: reproduce with PyTorch/Hugging Face and run a real experiment. Data: Tiny preference set.

## Acceptance Criteria
- [x] **AC-1** — Trains a small reward model on a tiny preference set and reports pairwise accuracy
- [x] **AC-2** — Runs DPO on a small language model and shows before/after generations on held-out prompts
- [x] **AC-3** — Discusses at least one documented failure mode such as reward hacking or over-optimisation
- [x] **AC-4** — Runs top-to-bottom in Google Colab with no local setup (FEAT-DL1)
- [x] **AC-5** — Passes `scripts/verify_notebook.sh` — executes clean on CPU in under 10 minutes with fixed seeds, no error outputs, no committed cell outputs (FEAT-DL3)
- [x] **AC-6** — Contains every section listed for `13b_alignment_rlhf_practical.ipynb` in `syllabus/manifest.yaml`

## Closing Note
`scripts/verify_notebook.sh notebooks/13b_alignment_rlhf_practical.ipynb` → `PASS:
13b_alignment_rlhf_practical.ipynb — clean execution in 50s (cap 600s)`. A reward model
trained on 134 pairwise comparisons (vowel density as a synthetic, clearly-labelled stand-in
for human preference) reaches 61.8% held-out pairwise accuracy — modest but genuinely above
chance. DPO fine-tunes a real character-level LSTM directly on the same preference pairs (no
reward model in the training loop) and shifts held-out-prompt generations modestly toward
higher vowel density (0.30→0.35, 0.33→0.38). Weakening the KL anchor (beta 0.05→0.01, larger
lr) on the identical preference set reproduces reward hacking directly: vowel density rises
further but the text collapses into repetitive near-nonsense — a genuine, measured failure
mode rather than one only described. Initial parameters (25-char completions, 60-pair
dataset) gave a below-chance reward model and no DPO movement; corpus, prompt count and
completion length were scaled up and the Bradley-Terry label sharpness increased before the
final honest numbers above were reached.

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/13b_alignment_rlhf_practical.ipynb
```

## Dependencies
- Blocked by: TASK-DL27
- Story: STORY-DL14 (Alignment: RLHF and Preference Optimisation)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
