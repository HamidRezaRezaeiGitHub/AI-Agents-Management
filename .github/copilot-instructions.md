# Copilot Repository Instructions

This repository, `man-agent-ment`, centrally manages AI coding-agent instructions, skills, hooks, commands, and reusable agent definitions.

Before making changes, read `AGENTS.md` and `ai/shared/agent-operating-contract.md`.

## Repository Layout

- `ai/shared/` contains canonical shared instructions.
- `ai/docs/` contains discovery and adoption documentation.
- `packs/default/` contains files copied into target projects.
- `ai/skills/`, `ai/hooks/`, `ai/commands/`, and `ai/agents/` hold reusable assets.
- `.github/`, `.claude/`, and `.gemini/` contain native adapters for specific tools.
- `scripts/` contains adoption and maintenance scripts.

## Working Rules

- Use `packs/default/ai/workflows/workflow-dispatch.md` first, then read only the workflows this task needs.
- For non-quick work, use `packs/default/ai/workflows/requirement-planning.md`; keep `PLAN.md` for status and `FINDINGS.md` for reusable requirement context.
- For implementation work, record baseline verification when available, validate before finishing, and use the two-pass review.
- Keep instruction files short, concrete, and tool-aware.
- Do not add secrets, tokens, or private local configuration.
- Verify commands before documenting them, or label them as unverified.
- If editing shell scripts, run `sh -n` on the changed script.
- If adding new agent assets, document how they are discovered or invoked.
