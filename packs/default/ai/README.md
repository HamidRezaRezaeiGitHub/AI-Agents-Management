# AI Agent Pack

This directory contains reusable workflows, scripts, templates, prompts, and metadata for agents in this project.

## Routing

`ai/workflows/workflow-dispatch.md` is the canonical routing table. Read it first to classify the request and pick the smallest set of workflows the task needs. For project orientation, start at `wiki/index.md` when it exists. When resuming work, read the active requirement's `PLAN.md` and `FINDINGS.md` before broad source discovery.

## Common Commands

```sh
ai/scripts/start-requirement.sh "Requirement Title"
ai/scripts/start-requirement.sh --stay-on-current-branch "Requirement Title"
ai/scripts/list-requirements.sh --open
ai/scripts/list-requirements.sh --stats
ai/scripts/lint-requirements.sh
ai/scripts/wiki-lint.sh
ai/scripts/wiki-lint.sh --warn-placeholders
```

## Metadata

`ai/pack.yaml` records the installed pack version.
