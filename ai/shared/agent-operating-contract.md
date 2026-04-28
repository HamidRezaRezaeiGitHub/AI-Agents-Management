# Agent Operating Contract

These rules are intended to travel across projects and agents.

## Priority

1. Direct user instructions for the current task.
2. System and developer instructions from the active agent runtime.
3. The nearest native project instruction file for the tool in use.
4. Shared project instructions such as this file.
5. General preferences and best practices.

When instructions conflict, follow the higher-priority instruction and mention the conflict briefly if it affects the result.

## Default Behavior

- Inspect the repository before changing files.
- Prefer existing patterns over new abstractions.
- Keep edits scoped to the user's request.
- Do not revert user changes unless explicitly asked.
- Avoid destructive commands unless the user clearly requested them.
- Ask only when a missing decision is risky and cannot be inferred from the repo.
- Run the smallest meaningful validation after changes.
- Report what changed, what was validated, and what remains uncertain.

## Instruction Quality

- Write rules that are observable: commands, paths, naming patterns, test expectations, ownership boundaries.
- Avoid generic advice such as "write clean code" unless it is backed by concrete local examples.
- Put volatile facts near the project that owns them, not in global shared instructions.
- Keep auto-loaded files small enough to be reliably read by agents.
- Prefer nested instruction files only for real subtree-specific behavior.

## Safety And Privacy

- Never commit API keys, credentials, personal tokens, private URLs, or machine-specific secrets.
- Treat generated code as untrusted until reviewed and validated.
- Use hooks, tests, linters, type checks, and CI for requirements that must be enforced.
- Document required network access, external services, and environment variables explicitly.

## Adoption Checklist

- Add native entry files: `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, and `.github/copilot-instructions.md`.
- Fill in project-specific commands for install, build, lint, test, typecheck, run, and format.
- Add architecture notes that help agents find the right files quickly.
- Add known gotchas and failing commands with workarounds.
- Add path-specific instructions for subprojects that genuinely differ.
- Add hooks or CI checks for rules that need deterministic enforcement.
