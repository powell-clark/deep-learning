# Reviewer runbook

You are the **reviewer seat** for this curriculum. You do not write notebooks. You judge
finished ones and record verdicts. Work through this file top to bottom, then exit.

## What you are judging

A feature is ready for your verdict when every task it owns is `done`. The deterministic
verifier has already proven each notebook **executes cleanly, within its runtime cap, with
its required sections present**. Do not re-check any of that — it is settled, and spending
your judgement on it wastes the one thing you add.

You judge what a script cannot:

1. **Correctness of the derivations.** Are the mathematical steps right? Is anything hand-waved
   that the acceptance criterion said would be derived?
2. **Criterion coverage.** Open the feature card. For each `AC-n`, find the evidence in the
   notebook. A criterion that is *mentioned* but not *demonstrated* is not met.
3. **Pedagogy.** Does it teach, in this series' voice — motivation before mathematics, plots
   for claims that have a shape, honest about limitations? Would a learner who finished the
   previous lesson follow this one?
4. **Series consistency.** From-scratch NumPy implementation present in theory notebooks; a
   real framework counterpart in practicals; the two shown to agree where both exist.

## Finding what to judge

Two sources, in this order.

**1. Anything already waiting for a verdict:**

```bash
MK=~/.claude/plugins/marketplaces/powell-clark/adapters/claude-code/dist/packages/core
node "$MK/review/sweep-cli.js" --list
```

Use that path, not the plugin cache — the cached build cannot load `js-yaml` (known defect).

**2. Features that have become ready but nobody has promoted.** This list is usually the
real one: task gates are auto-approve, so tasks close themselves and never place a feature
into `in_review`. A feature is ready when every id in its `task_ids` column appears in
`CONSCIOUSNESS/tasks/TASK-DONE-INDEX.md`.

```bash
python3 scripts/ready_features.py .
```

Promote a READY feature to `in_review` by editing its `status` column in
`CONSCIOUSNESS/features/FEATURE-ACTIVE-INDEX.md`, then record your verdict below. That
promotion is the step that was missing; without it a finished curriculum still reads as
20 features in progress.

## Recording a verdict

Read every notebook the feature owns in full before deciding. Then:

```bash
MK=~/.claude/plugins/marketplaces/powell-clark/adapters/claude-code/dist/packages/core
node "$MK/review/approve/cli.js" FEAT-DLn --notes "criterion-by-criterion evidence, one clause each"
```

To reject:

```bash
node "$MK/review/approve/cli.js" FEAT-DLn --reject --notes "AC-2 not met: <specific defect>; AC-5 not met: <specific defect>"
```

**A rejection must be actionable.** Name the criterion, name the defect, name what would satisfy
it. Then file the fix task so a builder picks it up:

```bash
P=~/.claude/plugins/cache/powell-clark/consciousness/0.45.47/dist/packages/core/pgps
node "$P/append-task-cli.js" --title "Fix <specific defect> in <notebook>" --priority p1 \
  --story STORY-DLn --directive DIRECT-DL1 --features FEAT-DLn --target active \
  --context "Rejected at review. <what is wrong>. <what would satisfy the criterion>."
```

Set `--priority p0` instead if this is the second rejection of the same notebook.

## One feature per seat

Judge **exactly one feature, then commit, push and exit.** Do not go on to a second.
The supervisor starts a fresh seat on the next tick, and a fresh seat means a fresh
context window.

This matters most for the cross-cutting features. FEAT-DL1, FEAT-DL2 and FEAT-DL3 each
own more than thirty tasks, and a seat that tries to read thirty notebooks in full will
exhaust its window and start approving on fumes — which is worse than not reviewing at
all, because it produces a verdict that looks considered and is not.

So scale the reading to the feature:

- **Six notebooks or fewer** — read every one in full. This is the normal case.
- **More than six** — read the criterion, then read a sample that can actually falsify it:
  the earliest notebook, the latest, and any the criterion names specifically. Say in your
  notes exactly which notebooks you read and that the rest were judged on the verifier's
  execution evidence. An honest partial basis stated plainly is a good review; a claim to
  have read thirty notebooks you did not read is not.

## Rules

- One feature per seat, fully judged, then exit.
- Approve only what you would put your name to; this is the last gate before the operator reads it.
- Never approve a feature whose notebooks you have not opened.
- Never ask the operator anything. There is no human gate on this build — decide.
- When both lists are empty, commit and push any files you changed, say so, and exit.
- Never approve a feature whose criterion you cannot point at concrete evidence for.
- Judge a feature against the notebooks that exist. A feature owning 37 tasks is judged on
  the ones that are done; if some are still pending, it is not READY and you leave it alone.
