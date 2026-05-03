# AGENTS.md

## Project Overview

TODO: Describe what this repository does, the primary runtime, and the main frameworks.

## Repository Map

- TODO: `src/` - application code.
- TODO: `tests/` - test suite.
- TODO: `.github/workflows/` - CI.

## Commands

- Install: TODO
- Build: TODO
- Lint: TODO
- Typecheck: TODO
- Test: TODO
- Run locally: TODO

Mark commands as verified after running them.

## Work Rules

- Before acting on a new request, route it with `ai/workflows/workflow-dispatch.md`. The dispatcher is the canonical map of which workflows apply to which kind of task; do not duplicate that table here.
- For project orientation, start with `wiki/index.md` when it exists, then inspect source code.
- Use `requirements/<slug>/PLAN.md` and `FINDINGS.md` to record plan, status, and discoveries; both are committed to the requirement branch so they travel with the work.
- Inspect existing patterns before editing.
- Keep changes scoped to the task.
- Do not add dependencies without a clear reason.
- Do not commit secrets or machine-specific configuration.
- Run the smallest meaningful validation before finishing.