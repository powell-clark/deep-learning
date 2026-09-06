# STORY-DL20: README/status lockstep across the four ML repos

## User Story
As Claude I want the four ML repos to share one README shape and one status line so that the
portfolio reads as one coherent series rather than four independently-formatted projects

## Context
The four repos: deep-learning, supervised-learning, unsupervised-learning, reinforcement-learning.
Kernel-measured (2026-09-06): they do not share one shape today. Operator clarification
(2026-09-06 15:01, verbatim): "lockstep readmes means the readmes are in the same style, the same
format, they do not necessarily have the same content, and the readmes are linked to the different
GitHub projects and all of them are public." Scope is presentation lockstep — same style, format,
h1 treatment and status line — never shared content, never a shared codebase.

## Acceptance Criteria
- [ ] The current README shape of all four repos is diffed and the divergences listed
- [ ] A common README shape (section order, status line format, h1 style) is agreed via the bus
      with the other three ML-repo seats — supervised-learning as reference — before it is applied
- [ ] The agreed shape is applied to all four repos' READMEs
- [ ] Each repo's status line is independently verifiable (matches its own PGPS state)
- [ ] Every notebook in every repo carries an Open-in-Colab badge whose target is fetched and
      confirmed live
- [ ] Each README links to its own repo's GitHub project board
- [ ] Each repo's public/private visibility is recorded as part of the audit

## Tasks
- TASK-DL049

## Links
- Directive: DIRECT-DL2 (Maintain the curriculum as a living Feynman-style corpus)
