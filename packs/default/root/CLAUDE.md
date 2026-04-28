# Claude Code Project Memory

Follow `AGENTS.md` for project instructions.

## Claude Notes

- For non-trivial requirements, use `ai/workflows/requirement-planning.md` before implementation.
- For non-developer or vibe-style requests, translate first with `ai/workflows/vibe-coding-translation.md`.
- For project orientation, read `wiki/index.md` when it exists and follow `ai/workflows/wiki-documentation.md` for wiki updates.
- Use concise terminal output per `ai/workflows/command-execution.md`.
- Before finishing implementation work, follow `ai/workflows/ci-validation.md`.
- When working on tests, follow `ai/workflows/testing-quality.md`.
- Use `/memory` to inspect loaded memory files if behavior seems inconsistent.
- Add project commands under `.claude/commands/` only when they are reusable by the team.
- Add project subagents under `.claude/agents/` only for recurring specialized workflows.
