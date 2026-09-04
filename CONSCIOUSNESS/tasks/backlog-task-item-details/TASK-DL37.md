# TASK-DL37: Corpus index and Colab badge table

## Context
Final task. Regenerate README.md's lesson catalogue and Colab badge table from the notebooks actually present, and set the status line to CORPUS-READY.

## Acceptance Criteria
- [ ] **AC-1** — README.md lists every delivered notebook with a working Open in Colab badge pointing at powell-clark/deep-learning
- [ ] **AC-2** — Lesson catalogue matches the notebooks present on disk, verified by a listing in the task's closing note
- [ ] **AC-3** — README.md status line reads CORPUS-READY with the notebook count
- [ ] **AC-4** — CURRICULUM_PLAN.md marked complete

## Technical Notes
Follow the series conventions: story-driven motivation before mathematics, derivations shown
step by step, plots for every claim that has a shape. Seed numpy and torch at the top. Keep
the total runtime under 10 minutes on CPU — subsample data and cap epochs rather than
reaching for a GPU. Do not commit cell outputs.

Verify before closing:
```
scripts/verify_notebook.sh notebooks/
```

## Dependencies
- Blocked by: TASK-DL1,TASK-DL2,TASK-DL3,TASK-DL4,TASK-DL5,TASK-DL6,TASK-DL7,TASK-DL8,TASK-DL9,TASK-DL10,TASK-DL11,TASK-DL12,TASK-DL13,TASK-DL14,TASK-DL15,TASK-DL16,TASK-DL17,TASK-DL18,TASK-DL19,TASK-DL20,TASK-DL21,TASK-DL22,TASK-DL23,TASK-DL24,TASK-DL25,TASK-DL26,TASK-DL27,TASK-DL28,TASK-DL29,TASK-DL30,TASK-DL31,TASK-DL32,TASK-DL33,TASK-DL34,TASK-DL35,TASK-DL36
- Story: STORY-DL17 (Professional Practice Series)
- Directive: DIRECT-DL1 (Ship complete deep learning curriculum)
