# Adoption Playbook

Use this when moving the central agent system into another project.

## 1. Inventory The Target Repo

- Read existing `README`, contribution docs, CI workflows, package files, and scripts.
- Identify install, build, lint, test, typecheck, format, run, migration, and release commands.
- Run the commands that are cheap and safe.
- Record known failures and required environment variables.

## 2. Install Native Entry Files

Copy or generate:

- `AGENTS.md`
- `CLAUDE.md`
- `GEMINI.md`
- `.github/copilot-instructions.md`
- `.github/instructions/*.instructions.md` when path-specific rules are useful
- `ai/workflows/requirement-planning.md`
- `ai/workflows/wiki-documentation.md`
- `ai/workflows/architecture.md`
- `ai/workflows/command-execution.md`
- `ai/workflows/ci-validation.md`
- `ai/workflows/testing-quality.md`
- `ai/workflows/code-review.md`
- `ai/workflows/vibe-coding-translation.md`
- `ai/templates/requirement/PLAN.md`
- `ai/templates/wiki/*.md`
- `ai/scripts/start-requirement.sh`
- `ai/scripts/audit-adoption.sh`
- `ai/scripts/wiki-lint.sh`
- `ai/prompts/adoption/*.md`
- `wiki/index.md`, `wiki/log.md`, and starter architecture/testing wiki pages

Use `scripts/install-adapter.sh /path/to/project` as a starting point. It copies files from `packs/default/` into each target path.

For existing projects with current AI instructions, install into a temporary folder first and use `packs/default/ai/prompts/adoption/first-time-existing-instructions.md` or `packs/default/ai/prompts/adoption/temp-install-review.md` to plan a safe migration.

## 3. Make Instructions Project-Specific

Fill in:

- what the project does,
- architecture and important paths,
- validated commands,
- code style that is not already enforced by formatters,
- testing strategy,
- security/privacy constraints,
- PR and commit expectations,
- common traps and workarounds.

## 4. Add Enforcement

Use instructions for guidance and hooks/CI for enforcement.

Good candidates for enforcement:

- formatting,
- linting,
- type checks,
- tests,
- secret scanning,
- generated-file checks,
- dependency policy.

For requirement planning, keep `requirements/` in `.gitignore`. If a project needs stronger enforcement, adapt `ai/hooks/pre-commit-block-requirements.sh` into that repo's pre-commit workflow.

## 5. Keep It Fresh

Review instructions when:

- package managers or runtimes change,
- CI changes,
- project layout changes,
- major agent tools change their discovery behavior,
- repeated agent failures reveal missing context.
