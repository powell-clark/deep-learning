# Deep Learning & Transformers curriculum — autonomous build design

Date: 2026-09-04 · Author: Fable 5.1 (planner seat) · Status: awaiting launch approval

## 1. Purpose

Fourth repository in the Powell-Clark machine-learning series (after `supervised-learning`,
`unsupervised-learning`, `reinforcement-learning`): a university-grade Deep Learning &
Transformers curriculum from first principles, built and verified entirely by autonomous
Claude Code sessions under the consciousness plugin, with no human review gate anywhere.
The operator's only interactions are (1) approving this plan and its spend, and (2) reading
the finished corpus.

Series conventions carried forward unchanged: paired theory (`a`) + practical (`b`) Colab
notebooks per lesson; every algorithm derived from first principles and implemented from
scratch in NumPy, then reproduced with a production framework (PyTorch / Hugging Face);
story-driven motivation before mathematics; no local setup required.

## 2. Approaches considered

| | Approach | Verdict |
|---|---|---|
| A | One sequential Sonnet builder loop, reviewer runs at the end | Simplest, ~24 h wall clock, single point of failure, review feedback arrives too late to steer |
| B | **Two Sonnet builder loops + one Opus reviewer on a cadence, bash supervisor keeps seats alive** | **Chosen.** ~12–18 h, review feedback flows back into the queue as fix tasks, supervisor is deterministic and free |
| C | Fan-out: one session per notebook via a Workflow | Fastest, but 36 concurrent writers on shared PGPS indexes and one repo — merge contention the plugin's claim protocol is not sized for |

## 3. Syllabus

Sixteen lessons (0–15), each a theory + practical pair, plus four professional-practice
notebooks. 36 notebooks. Every notebook must execute top-to-bottom on CPU in ≤ 10 minutes
with fixed seeds (small models, data subsets, few epochs); GPU is optional acceleration only.

| # | Lesson | `a` theory (from scratch, NumPy) | `b` practical (PyTorch / HF) | Data |
|---|---|---|---|---|
| 0 | Introduction to Deep Learning | What stacking non-linear layers buys; representation learning; the computational graph; a forward-only two-layer net | Tensors, autograd, `nn.Module`, the training-loop skeleton; Colab GPU check | FashionMNIST |
| 1 | From Linear Models to Neurons | Perceptron → logistic regression as a one-layer net; loss surfaces; batch vs mini-batch vs SGD; learning-rate effects | Same model in PyTorch; `DataLoader`; overfit-one-batch sanity check | MNIST |
| 2 | Multilayer Perceptrons & Backpropagation | Chain rule → backprop for an L-layer MLP; manual gradients; gradient checking; sigmoid/tanh/ReLU and derivatives | PyTorch MLP; autograd vs manual gradients; hooks | MNIST subset |
| 3 | Training Dynamics | Xavier/He initialisation derived; vanishing/exploding gradients; BatchNorm & LayerNorm; momentum, RMSProp, Adam derived; schedules | init × norm × optimiser ablation; LR finder; schedulers | CIFAR-10 subset |
| 4 | Regularisation & Generalisation | Bias–variance in deep nets; weight decay ≡ L2; dropout as ensemble; early stopping; augmentation; double descent | Augmentation pipelines; dropout / weight-decay ablations; learning curves | CIFAR-10 subset |
| 5 | Convolutional Networks | Convolution as a linear operator; parameter sharing; padding/stride; receptive fields; pooling; backprop through conv | CNN on CIFAR-10; feature-map visualisation | MNIST, CIFAR-10 |
| 6 | Modern Architectures & Transfer Learning | Residual connections and why they help; norm placement; depthwise-separable convs; architecture families | Fine-tune a pretrained torchvision ResNet; feature extraction vs full fine-tune | Small image set |
| 7 | Sequence Models | RNN forward and backprop-through-time; vanishing gradients; LSTM/GRU gates derived; char-RNN | LSTM language model; sampling; teacher forcing | Tiny text corpus |
| 8 | Embeddings & Tokenisation | Distributional hypothesis; skip-gram with negative sampling derived; embedding geometry and analogies | BPE tokeniser from scratch → `tokenizers`; embedding layers; visualisation | Small corpus |
| 9 | Attention | The alignment problem; additive vs scaled dot-product attention derived; attention as soft lookup | Seq2seq with attention on a synthetic task; attention heatmaps | Synthetic |
| 10 | The Transformer | Multi-head self-attention; positional encodings; residual + LayerNorm blocks; causal masking; parameter counting | Decoder-only transformer on a small task; compared to the LSTM | Synthetic / tiny text |
| 11 | Language Model Pretraining | Autoregressive objective; cross-entropy and perplexity; scaling intuition; tokenisation effects; mini-GPT forward + loss | GPT-style model trained ~5 min; generation; then HF GPT-2 inference | Tiny Shakespeare |
| 12 | Fine-tuning & Adaptation | Full fine-tuning vs feature extraction; LoRA low-rank update derived; prompting vs fine-tuning; catastrophic forgetting | HF fine-tune of a small encoder for sentiment; LoRA via PEFT | Small sentiment subset |
| 13 | Alignment: RLHF & Preference Optimisation | Preference modelling; Bradley–Terry reward model derived; the RLHF loop (links to the RL series); DPO derived | DPO on a tiny preference set with a small LM; before/after | Tiny preference set |
| 14 | Generative Models | Autoencoders; VAE ELBO and reparameterisation derived; diffusion forward/reverse process derived | VAE and a minimal diffusion model; sampling | MNIST |
| 15 | Efficient & Scalable Deep Learning | Compute/memory accounting; mixed precision; int8 quantisation derived; distillation; data/model parallelism concepts | AMP; dynamic quantisation; distil a CNN; throughput measurements | CIFAR-10 subset |
| X1 | Debugging Deep Networks | Loss-curve taxonomy; gradient norms; dead ReLUs; overfit-one-batch; NaN hunting; seeds | | |
| X2 | Evaluation & Benchmarking | Splits and leakage; metrics beyond accuracy; calibration; statistical comparison of runs; LLM-eval basics | | |
| X3 | Deployment & Safety | TorchScript/ONNX export; latency and throughput; monitoring and drift; robustness; responsible use | | |
| X4 | Research Frontiers | Scaling laws; mixture of experts; state-space models; multimodal; interpretability; staying current | | |

File names follow the series: `notebooks/{n}a_{slug}_theory.ipynb`, `notebooks/{n}b_{slug}_practical.ipynb`,
`notebooks/X{n}_{slug}.ipynb`.

## 4. PGPS structure (project code `DL`)

- **DIRECT-DL1** Ship complete deep learning curriculum.
- **STORY-DL1..16** one per lesson, **STORY-DL17** professional practice. Titles in the
  validator's user-story form (`As Claude I want … so that …`).
- **Features** — all kano `performance`, which resolves to the *agent* tier, hard gate,
  one agent verdict (`DEFAULT_GATES.feature.kano_overrides.performance`). No `must-have`
  anywhere, because `must-have` resolves to the human tier.
  - FEAT-DL1 Colab-runnable notebooks (every task)
  - FEAT-DL2 From-scratch NumPy + PyTorch/Hugging Face dual implementation (lesson tasks)
  - FEAT-DL3 Verified reproducibility — passes the deterministic verifier in ≤ 10 min CPU with fixed seeds (every task)
  - FEAT-DL4..19 one per lesson 0–15; FEAT-DL20 professional-practice series
- **Tasks** — TASK-DL1..36 one per notebook (`b` `blocked_by` its `a`), TASK-DL37 corpus
  index and README badges (`blocked_by` every notebook task). Each card carries concrete,
  mechanically checkable acceptance criteria: required section headings, the from-scratch
  component named, the framework counterpart named, the verifier command, the runtime cap.
  Tasks and stories use the default auto-approve gate.

Closure chain, all autonomous: builder verifies → `update-task-status --to in_review`
→ `--to done --verdict bypass-approved` (task gate is auto-approve) → when every task of a
feature is done the reviewer records an agent verdict → feature `maintained` → story
`fulfilled` → directive done.

## 5. Seats and dispatch

| Seat | Model / effort | Count | Job |
|---|---|---|---|
| Planner | Fable 5.1, high | this session | This spec, all cards, scaffold, verifier, CI, runbook, supervisor. Exits after launch. |
| Builder | Sonnet 5, high, solo | 2 | `/consciousness:on`; claims one task at a time via the plugin's atomic trunk claim; builds the notebook; runs the verifier; closes the task on the auto-approve path; commits and pushes. Unscoped — the claim protocol prevents double-claims and two builders on different lessons touch disjoint index rows. |
| Reviewer | Opus 5, high, solo | 1, on demand | Reads each notebook whose feature awaits an agent verdict; judges every acceptance criterion; records `approve` or `--reject --notes` through the plugin's approve CLI; on reject, appends a `p1` fix task with the defect list so a builder picks it up. |
| Escalation builder | Opus 5, xhigh | on demand | Started by the supervisor when a task carries two rejections; fix task is set `p0` so it is claimed first. |

Model choices follow `~/.claude/advisor-lanes/model-selection.md`: bounded, well-specified
authoring → Sonnet high solo; judgement → Opus solo; escalate on an objective failure
signal (a rejection verdict), capped at two steps.

Dispatch uses the host's native background-session manager, per the dispatch precept:

```
claude --bg --name dl-builder-1 --model sonnet --effort high \
  --permission-mode bypassPermissions "/consciousness:on"
```

run from the repository root. `bypassPermissions` is required for an unattended seat and is
scoped to this repository's directory; the seats hold no credentials beyond the operator's
Claude login and `gh` auth already on this machine.

**Supervisor** — `scripts/supervisor.sh`, cron every 15 minutes, no LLM cost when idle:
1. `git pull --ff-only` the repo; run PGPS `--sequence` (node) → claimable count.
2. Count live builder seats from `claude agents --json`; while claimable > 0 and live < 2,
   start a builder. Respawn nothing that exited with `status-complete`.
3. Run the review sweep `--list` (node) → features awaiting agent verdicts; if > 0 and no
   reviewer live, start the reviewer with the runbook prompt.
4. If any task has ≥ 2 rejections and no escalation seat is live, start one Opus builder.
5. When claimable = 0 and awaiting-verdict = 0 and every notebook task is done: write
   `CORPUS-READY` to `README.md`'s status line, remove the cron lines, exit.

Every launch is logged to `CONSCIOUSNESS/stream/dispatch-log.jsonl` (seat, model, effort,
reason) so outcomes can be audited against the model-selection doc.

## 6. Verification — three layers, deterministic first

1. **Verifier (blocking)** `scripts/verify_notebook.sh <notebook>` — executes the notebook
   in the repo `.venv` with `jupyter nbconvert --execute`, 900 s timeout; fails on any error
   output, on baked outputs committed to git, on a missing required heading from
   `syllabus/manifest.yaml`, or on wall clock > 600 s. Builders must run it before
   `in_review`; the task card names the command.
2. **CI (evidence)** `.github/workflows/verify-notebooks.yml` runs the verifier on notebooks
   changed by each push, CPU runner. Green CI is cited in verdict notes; it is not a blocker,
   so an outage cannot stall the loop.
3. **Judgement (gate)** Opus reviewer per §5. Rule from model-selection §6: no model is
   spent on what the verifier already decides — the reviewer judges derivation correctness,
   pedagogy, and criterion coverage only.

## 7. Repository scaffold (planner writes before launch)

`README.md` (series header, status line, badge table generated by TASK-DL37),
`CURRICULUM_PLAN.md` (§3 in prose, series style), `requirements.txt` (numpy, pandas,
matplotlib, seaborn, scikit-learn, tqdm, torch, torchvision, transformers, datasets,
tokenizers, peft, jupyter, nbconvert), `.venv/` built by `scripts/setup_env.sh`,
`syllabus/manifest.yaml` (per-notebook required headings and runtime cap — the verifier's
and the builders' shared contract), `scripts/verify_notebook.sh`, `scripts/supervisor.sh`,
`REVIEWER.md` (the reviewer seat's runbook prompt), `.gitattributes` (`merge=union` for
`CONSCIOUSNESS/CHANGELOG.md` and `CONSCIOUSNESS/tasks/TASK-DONE-INDEX.md` — append-only rows
whose ids are minted against origin/main; the ACTIVE index is rewritten in place and stays
on the default merge), `.gitignore` (series pattern plus stream exhaust), `LICENSE.md`
(copied from the RL repo), `CONSCIOUSNESS/` scaffolded by the plugin's setup-wizard CLI in
non-interactive mode with `modules.reviewGates: true` and the host block cap set to 100.

## 8. Cost, time, rollback, risks

- **Sessions:** 2 Sonnet builders continuously, 1 Opus reviewer intermittently, up to 1 Opus
  escalation builder; the supervisor is bash+node.
- **Cost (order of magnitude):** 37 tasks × ~$5 Sonnet ≈ $185; 20 features × ~$4 Opus ≈ $80;
  ~30% rework ≈ $80 → **≈ $350 / £260** at API rates, or the equivalent plan quota. Actuals
  are read from the Anthropic console; the dispatch log gives the per-seat denominator.
- **Wall clock:** ≈ 12–18 hours from launch to `CORPUS-READY`.
- **Rollback:** `crontab` lines removed, `claude stop` each seat, repo is additive (delete
  `powell-clark/deep-learning` on GitHub if abandoning). Nothing outside this repo, the
  crontab, and `~/.claude` session state is touched.
- **Risks:**
  - *Plugin defect:* the cached plugin's review CLIs (`approve`, `review-sweep`) fail with
    `ERR_MODULE_NOT_FOUND: js-yaml` — the cache ships no `node_modules`. The marketplace
    checkout at `~/.claude/plugins/marketplaces/powell-clark/adapters/claude-code/dist/`
    is byte-identical (sha256 checked) and resolves the dependency, so the reviewer runs
    those two CLIs from there. Nothing in `~/.claude/plugins/` is modified. Filed upstream
    as a defect once approved.
  - *Index contention:* two builders pushing to `main`; mitigated by union attributes on
    append-only files, disjoint rows on the active index, and `git pull --rebase` retry.
  - *Network:* dataset downloads (torchvision, Hugging Face) need internet in the verifier
    and on Colab; every notebook caches to a `data/` directory ignored by git.
  - *Colab parity:* the verifier runs CPU; the runtime cap makes CPU the binding constraint
    so Colab's free tier is never slower than what was verified.

## 9. Deliverable

`README.md` with an Open-in-Colab badge per notebook, `CURRICULUM_PLAN.md`, 36 verified
notebooks, `CONSCIOUSNESS/` carrying every verdict with the verifying command in its notes,
and a `CORPUS-READY` status line — the signal that it is time to read.
