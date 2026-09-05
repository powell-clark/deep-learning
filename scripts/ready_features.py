#!/usr/bin/env python3
"""List features and say which are ready for review.

A feature is READY when every task id in its task_ids column appears in
TASK-DONE-INDEX.md. Nothing promotes features automatically: task gates are
auto-approve, so tasks close themselves and never place their owning feature
into in_review. The reviewer seat uses this to find its own work.
"""
import pathlib
import sys

root = pathlib.Path(sys.argv[1] if len(sys.argv) > 1 else ".")
done_index = root / "CONSCIOUSNESS/tasks/TASK-DONE-INDEX.md"
feature_index = root / "CONSCIOUSNESS/features/FEATURE-ACTIVE-INDEX.md"

done = {
    line.split("|")[0]
    for line in done_index.read_text().splitlines()[1:]
    if line.strip()
}

ready = 0
for line in feature_index.read_text().splitlines()[1:]:
    if not line.strip():
        continue
    cols = line.split("|")
    tasks = [t for t in cols[6].split(",") if t]
    outstanding = [t for t in tasks if t not in done]
    verdict = "READY" if not outstanding else f"waiting on {len(outstanding)}"
    ready += not outstanding
    print(f"{cols[0]:10} {cols[1]:12} {len(tasks) - len(outstanding):3}/{len(tasks):<3} tasks done  {verdict}")

print(f"\n{ready} feature(s) ready for review.")
