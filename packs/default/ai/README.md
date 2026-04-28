# AI Agent Pack

This directory contains reusable workflows, scripts, templates, prompts, and metadata for AI coding agents in this project.

## Start Here

- Before choosing a workflow: `ai/workflows/workflow-dispatch.md`
- For a new standard, large, or risky requirement: `ai/workflows/requirement-planning.md`
- For stakeholder or vibe-style input: `ai/workflows/vibe-coding-translation.md`
- For project orientation: `wiki/index.md`
- For architecture-sensitive work: `ai/workflows/architecture.md`
- For terminal commands: `ai/workflows/command-execution.md`
- For testing: `ai/workflows/testing-quality.md`
- For CI readiness: `ai/workflows/ci-validation.md`
- For final self-review or PR review: `ai/workflows/code-review.md`
- For wiki maintenance: `ai/workflows/wiki-documentation.md`

## Complexity Routing

- `quick`: answer, inspect, or make the smallest safe edit without creating a requirement workspace.
- `standard`: create or resume `requirements/<slug>/`, then use `PLAN.md` and `FINDINGS.md`.
- `large`: use the standard flow plus explicit architecture, testing, CI, and review checkpoints.
- `risky`: use the large flow and ask before irreversible, production, privacy, security, or data-impacting actions.

Use the lowest level that handles the real risk. If a task grows, update `PLAN.md` with the new level and why.

For `standard`, `large`, or `risky` implementation work, identify and run a safe baseline verification before source edits when the project provides one. Record the command and result in `PLAN.md`.

## Common Commands

```sh
ai/scripts/start-requirement.sh "Requirement Title"
ai/scripts/audit-adoption.sh
ai/scripts/wiki-lint.sh
```

`start-requirement.sh` creates both `PLAN.md` and `FINDINGS.md` under `requirements/<slug>/`.

## Metadata

`ai/pack.yaml` records the installed pack version.
