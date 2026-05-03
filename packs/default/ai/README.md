# AI Agent Pack

This directory contains reusable workflows, scripts, templates, prompts, and metadata for agents in this project.

## Start Here

- Before choosing a workflow: `ai/workflows/workflow-dispatch.md`
- For a new standard, large, or risky requirement: `ai/workflows/requirement-planning.md`
- For stakeholder or vibe-style input: `ai/workflows/vibe-coding-translation.md`
- For project orientation: `wiki/index.md`
- For resuming interrupted work: read the active `PLAN.md`, `FINDINGS.md`, branch/status, recent diffs, and handoff notes before new discovery.
- For architecture-sensitive work: `ai/workflows/architecture.md`
- For terminal commands: `ai/workflows/command-execution.md`
- For debugging bugs, failing tests, build breaks, regressions, or unexpected behavior: `ai/workflows/systematic-debugging.md`
- For testing: `ai/workflows/testing-quality.md`
- For CI readiness: `ai/workflows/ci-validation.md`
- For final self-review or PR review: `ai/workflows/code-review.md` with two passes: requirement fit, then implementation quality and risk
- For wiki maintenance: `ai/workflows/wiki-documentation.md`

## Common Commands

```sh
ai/scripts/start-requirement.sh "Requirement Title"
ai/scripts/start-requirement.sh --stay-on-current-branch "Requirement Title"
ai/scripts/list-requirements.sh --open
ai/scripts/list-requirements.sh --stats
ai/scripts/lint-requirements.sh
ai/scripts/audit-adoption.sh
ai/scripts/wiki-lint.sh
ai/scripts/wiki-lint.sh --warn-placeholders
```

`start-requirement.sh` creates both `PLAN.md` and `FINDINGS.md` under `requirements/<slug>/`.
By default it creates or switches to the requirement branch. Use `--stay-on-current-branch` only when the current branch is already the right feature branch for the work.

`list-requirements.sh` lists local requirement plans by created time, modified time, status, or open state.
Use `list-requirements.sh --stats` to count requirements by status category.
`lint-requirements.sh` reports requirement metadata and workspace issues without modifying files.

## Metadata

`ai/pack.yaml` records the installed pack version.
