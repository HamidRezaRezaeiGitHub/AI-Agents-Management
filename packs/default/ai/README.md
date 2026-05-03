# AI Agent Pack

This directory contains reusable workflows, scripts, templates, prompts, and metadata for agents in this project.

## Start Here

- Before choosing a workflow: `ai/workflows/workflow-dispatch.md`
- For a new standard, large, or risky requirement: `ai/workflows/requirement-planning.md`
- For stakeholder or vibe-style input: `ai/workflows/vibe-coding-translation.md`
- For project orientation: `wiki/index.md`
- For architecture-sensitive work: `ai/workflows/architecture.md`
- For terminal commands: `ai/workflows/command-execution.md`
- For testing: `ai/workflows/testing-quality.md`
- For CI readiness: `ai/workflows/ci-validation.md`
- For final self-review or PR review: `ai/workflows/code-review.md` with two passes: requirement fit, then implementation quality and risk
- For wiki maintenance: `ai/workflows/wiki-documentation.md`

## Common Commands

```sh
ai/scripts/start-requirement.sh "Requirement Title"
ai/scripts/start-requirement.sh --stay-on-current-branch "Requirement Title"
ai/scripts/wiki-lint.sh
ai/scripts/wiki-lint.sh --warn-placeholders
```

## Metadata

`ai/pack.yaml` records the installed pack version.
