# Default Pack

Installable starter pack for adopting projects.

Files under this directory are source templates. `scripts/install-adapter.sh` maps them into each target project's expected native locations.

## Target Mapping

- `root/AGENTS.md` -> `AGENTS.md`
- `root/CLAUDE.md` -> `CLAUDE.md`
- `root/GEMINI.md` -> `GEMINI.md`
- `root/.github/copilot-instructions.md` -> `.github/copilot-instructions.md`
- `claude/commands/start-requirement.md` -> `.claude/commands/start-requirement.md`
- `ai/workflows/requirement-planning.md` -> `ai/workflows/requirement-planning.md`
- `ai/templates/requirement/PLAN.md` -> `ai/templates/requirement/PLAN.md`
- `ai/scripts/start-requirement.sh` -> `ai/scripts/start-requirement.sh`
- `ai/hooks/pre-commit-block-requirements.sh` -> `ai/hooks/pre-commit-block-requirements.sh`

The `ai/scripts` target avoids colliding with a project's existing application scripts.
