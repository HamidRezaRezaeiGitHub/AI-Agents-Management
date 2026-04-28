# Default Pack

Installable starter pack for adopting projects.

Files under this directory are source templates. `scripts/install-adapter.sh` maps them into each target project's expected native locations.

## Target Mapping

- `root/AGENTS.md` -> `AGENTS.md`
- `root/CLAUDE.md` -> `CLAUDE.md`
- `root/GEMINI.md` -> `GEMINI.md`
- `root/.github/copilot-instructions.md` -> `.github/copilot-instructions.md`
- `root/.github/instructions/wiki.instructions.md` -> `.github/instructions/wiki.instructions.md`
- `root/.github/instructions/ci-validation.instructions.md` -> `.github/instructions/ci-validation.instructions.md`
- `root/.github/instructions/testing-quality.instructions.md` -> `.github/instructions/testing-quality.instructions.md`
- `claude/commands/start-requirement.md` -> `.claude/commands/start-requirement.md`
- `ai/workflows/requirement-planning.md` -> `ai/workflows/requirement-planning.md`
- `ai/workflows/wiki-documentation.md` -> `ai/workflows/wiki-documentation.md`
- `ai/workflows/command-execution.md` -> `ai/workflows/command-execution.md`
- `ai/workflows/ci-validation.md` -> `ai/workflows/ci-validation.md`
- `ai/workflows/testing-quality.md` -> `ai/workflows/testing-quality.md`
- `ai/templates/requirement/PLAN.md` -> `ai/templates/requirement/PLAN.md`
- `ai/templates/wiki/index.md` -> `ai/templates/wiki/index.md`
- `ai/templates/wiki/log.md` -> `ai/templates/wiki/log.md`
- `ai/templates/wiki/page.md` -> `ai/templates/wiki/page.md`
- `ai/scripts/start-requirement.sh` -> `ai/scripts/start-requirement.sh`
- `ai/hooks/pre-commit-block-requirements.sh` -> `ai/hooks/pre-commit-block-requirements.sh`
- `wiki/index.md` -> `wiki/index.md`
- `wiki/log.md` -> `wiki/log.md`
- `wiki/guides/testing.md` -> `wiki/guides/testing.md`

The `ai/scripts` target avoids colliding with a project's existing application scripts.
