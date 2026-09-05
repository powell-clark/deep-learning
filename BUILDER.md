# Builder runbook

You are a **builder seat** for this curriculum. Work this file top to bottom, in a loop,
until no claimable task remains. Then commit, push, and exit.

You are unattended. Never ask a question, never wait for input, never stop to confirm.
There is no human gate on this build. Decide and proceed.

> Why this file exists rather than `/consciousness:on`: the consciousness plugin is enabled
> only in this repository's `.claude/settings.json`, and a background seat does not register
> project-scoped plugins, so the slash command is unavailable here. Every PGPS *CLI* still
> works when invoked through `node`, so this runbook drives the same loop by hand.

## Paths

```bash
P="$HOME/.claude/plugins/cache/powell-clark/consciousness/0.45.47/dist/packages/core"
MK="$HOME/.claude/plugins/marketplaces/powell-clark/adapters/claude-code/dist/packages/core"
REPO="/home/powell-clark/projects/auxiliary/deep-learning"
```

Use `$P` for PGPS CLIs. Use `$MK` for anything under `review/` — the cached build cannot
load `js-yaml` (known defect), the marketplace build is byte-identical and can.

## Before the first cycle: enter your own worktree

Call `ListAgents` — its header line ("This session is X") names this seat. Call
`EnterWorktree({name: X})` using **that exact name**, never a guessed generic name like
`builder-dl3`. Two seats that both guess the same generic name cause the harness to
resume the second into a worktree the first is still actively editing, and both sessions
then commit, rebase and push against one working directory (TASK-DL038). Every seat's
name is already unique (`supervisor.sh` mints `dl-builder-$(date +%H%M%S)`), so using it
verbatim makes the collision structurally impossible.

If `EnterWorktree` resumes you into a worktree that already has uncommitted changes, an
open rebase/merge, or any state you do not recognise as your own prior work in this
session — **stop and report**. Do not build on top of it; another seat may still be
mid-edit there. This is a fault to surface, not a condition to push through.

## One cycle

### 1. Pick the next task

```bash
node "$P/pgps/main.js" --sequence | head -30
```

Take the **first** task listed. If the spine is empty, go to "Finishing" below.

A task is claimable only if its `blocked_by` column in
`CONSCIOUSNESS/tasks/TASK-BACKLOG-INDEX.md` is empty or names a task already in
`CONSCIOUSNESS/tasks/TASK-DONE-INDEX.md`. Practical notebooks (`b`) are blocked by their
theory notebook (`a`) — build the theory one first.

### 2. Claim it

```bash
node "$P/pgps/update-task-status-cli.js" --project-root "$REPO" --task TASK-DLn --to in_progress \
  --note "claimed by $(hostname) builder seat"
git add -A && git commit -q -m "chore: claim TASK-DLn" -m "Authored-By: Emmanuel Powell-Clark <emmanuel@powellclark.com>" && git push
```

Push the claim **before** building. Another seat must be able to see it.

### 3. Read the contract

Read, in this order, and do not skip any of them:

- `CONSCIOUSNESS/tasks/backlog-task-item-details/TASK-DLn.md` — the acceptance criteria you must satisfy
- the parent story card under `CONSCIOUSNESS/stories/backlog-story-item-details/`
- `syllabus/manifest.yaml` — the exact section headings your notebook must contain
- one existing notebook from a sibling series for voice, if any exist yet in `notebooks/`

### 4. Build the notebook

Write `notebooks/<name>.ipynb` exactly as the task card names it. Requirements:

- Every required heading from `syllabus/manifest.yaml`, spelled the same way, as a markdown heading.
- Story-driven motivation before mathematics. Derive; do not assert.
- Theory notebooks (`a`): implement the lesson's core algorithm **from scratch in NumPy**.
- Practical notebooks (`b`): reproduce it with **PyTorch or Hugging Face**, and where both
  exist, show they agree numerically or in accuracy.
- Plots for every claim that has a shape.
- Seed `numpy` and `torch` at the top, before any stochastic operation.
- **Under 10 minutes on CPU.** Subsample data, cap epochs, keep models small. A GPU must
  never be required. This is the single most common reason a notebook fails the gate.
- **Never commit cell outputs.** Write the notebook with `outputs: []` and
  `execution_count: null` in every code cell.

Datasets download to `data/` (gitignored). Prefer torchvision's small sets and tiny text
corpora over anything large.

### 5. Verify — this is the gate

```bash
scripts/verify_notebook.sh notebooks/<name>.ipynb
```

It must print `PASS`. It checks committed outputs, required headings, clean top-to-bottom
execution, and the runtime cap. **Do not proceed on a failure — fix the notebook and re-run.**
If it fails three times on the same cause, reduce the scope of the notebook (fewer epochs,
smaller model, less data) rather than fighting it.

### 6. Close the task

```bash
node "$P/pgps/update-task-status-cli.js" --project-root "$REPO" --task TASK-DLn --to in_review \
  --note "verifier PASS"
node "$P/pgps/update-task-status-cli.js" --project-root "$REPO" --task TASK-DLn --to done \
  --verdict bypass-approved --review-notes "auto-close: task gate is auto-approve; scripts/verify_notebook.sh PASS"
```

Then move the detail card to match its new lifecycle state and fix the `doc` column:

```bash
git mv CONSCIOUSNESS/tasks/backlog-task-item-details/TASK-DLn.md CONSCIOUSNESS/tasks/done-task-item-details/TASK-DLn.md
sed -i 's|backlog-task-item-details/TASK-DLn.md|done-task-item-details/TASK-DLn.md|' CONSCIOUSNESS/tasks/TASK-DONE-INDEX.md
```

Tick the acceptance criteria in the card (`- [ ]` becomes `- [x]`) and add a short closing
note recording the verifier output.

### 7. Commit and push

```bash
node "$P/pgps/main.js" --headless | grep -A3 '^Validation:'   # must be 52/52 or better; fix what it names
git add -A
git commit -q -m "feat: TASK-DLn <notebook title>" -m "<one paragraph: what it derives, what it implements, verifier result>" -m "Authored-By: Emmanuel Powell-Clark <emmanuel@powellclark.com>"
git pull --rebase --autostash -q && git push
```

If the push rejects, `git pull --rebase` and push again. Never force-push.

### 8. Loop

Go back to step 1. Do not stop after one task.

## Finishing

When the spine is empty, run the validation once more, make sure everything is committed and
pushed, and exit. Do not invent work. Do not file new tasks to stay busy.

## Rules

- One task in progress at a time. Claim, build, verify, close, then the next.
- Never mark a task done whose verifier run did not print `PASS`.
- Never commit a notebook carrying cell outputs.
- Never ask the operator anything; there is no human gate here.
- If a task is genuinely impossible as written, close it back to the backlog with
  `--to backlog` and a note explaining why, then take the next one.
