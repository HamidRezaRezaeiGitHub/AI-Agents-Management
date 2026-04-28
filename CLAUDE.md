# Claude Code Project Memory

This repository is the central management system for AI coding-agent instructions and reusable assets.

Follow the shared contract in @ai/shared/agent-operating-contract.md.

## Claude-Specific Notes

- Before acting on a new request, route it with `packs/default/ai/workflows/workflow-dispatch.md` so quick tasks stay lightweight and larger work gets the right process.
- For standard, large, or risky requirements, use `packs/default/ai/workflows/requirement-planning.md`.
- Keep `CLAUDE.md` high-signal because Claude Code loads it as project memory.
- Prefer importing shared files with `@path` instead of duplicating long guidance.
- Store project commands in `.claude/commands/`.
- Store project subagents in `.claude/agents/`.
- Store committed project settings in `.claude/settings.json` only when they are safe for the team.
- Keep local/private settings in `.claude/settings.local.json` and do not commit them.
