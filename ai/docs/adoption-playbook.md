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

Use `scripts/install-adapter.sh /path/to/project` as a starting point.

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

## 5. Keep It Fresh

Review instructions when:

- package managers or runtimes change,
- CI changes,
- project layout changes,
- major agent tools change their discovery behavior,
- repeated agent failures reveal missing context.
