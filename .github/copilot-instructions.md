# Copilot Repository Instructions

This repository centrally manages AI coding-agent instructions, skills, hooks, commands, and reusable agent definitions.

Before making changes, read `AGENTS.md` and `ai/shared/agent-operating-contract.md`.

## Repository Layout

- `ai/shared/` contains canonical shared instructions.
- `ai/docs/` contains discovery and adoption documentation.
- `packs/default/` contains files copied into target projects.
- `ai/skills/`, `ai/hooks/`, `ai/commands/`, and `ai/agents/` hold reusable assets.
- `.github/`, `.claude/`, and `.gemini/` contain native adapters for specific tools.
- `scripts/` contains adoption and maintenance scripts.

## Working Rules

- For non-trivial requirements, follow `packs/default/ai/workflows/requirement-planning.md` before implementation and use the local `requirements/<slug>/PLAN.md` as handoff context.
- Keep instruction files short, concrete, and tool-aware.
- Do not add secrets, tokens, or private local configuration.
- Verify commands before documenting them, or label them as unverified.
- If editing shell scripts, run `sh -n` on the changed script.
- If adding new agent assets, document how they are discovered or invoked.
