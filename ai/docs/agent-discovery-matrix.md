# Agent Discovery Matrix

Last reviewed: 2026-04-28.

## Cross-Agent Baseline

`AGENTS.md` is the best shared anchor. The public AGENTS.md project describes it as a dedicated project guide for coding agents, with nested files for subprojects and nearest-file precedence. OpenAI Codex, GitHub Copilot agents, and other tools recognize it directly or reference the convention.

Source: https://agents.md/

## OpenAI Codex

- Auto-discovers `AGENTS.md`.
- Scope is the directory tree rooted at the folder containing the file.
- More deeply nested `AGENTS.md` files take precedence for files under that subtree.
- Direct prompt/runtime instructions take precedence over `AGENTS.md`.
- Use it for repo navigation, build/test commands, coding conventions, PR guidance, and validation requirements.

Sources:

- https://openai.com/index/introducing-codex/
- https://github.com/openai/codex/blob/main/docs/agents_md.md

## Claude Code

- Auto-loads project memory from `./CLAUDE.md`.
- Also supports user memory at `~/.claude/CLAUDE.md` and enterprise memory locations.
- Searches upward from the current working directory for `CLAUDE.md`.
- Discovers nested `CLAUDE.md` files under the working tree when reading files in those subtrees.
- Supports imports with `@path/to/file`, including recursive imports up to a documented limit.
- Project slash commands live in `.claude/commands/`.
- Project subagents live in `.claude/agents/`.
- Hooks are configured in settings files such as `.claude/settings.json` and user settings.

Sources:

- https://docs.anthropic.com/en/docs/claude-code/memory
- https://docs.claude.com/en/docs/claude-code/slash-commands
- https://docs.claude.com/en/docs/claude-code/subagents
- https://docs.claude.com/en/docs/claude-code/hooks

## GitHub Copilot

- Repository-wide custom instructions live at `.github/copilot-instructions.md`.
- Path-specific instructions live under `.github/instructions/NAME.instructions.md`.
- Path-specific files use YAML frontmatter with `applyTo` globs.
- Copilot agent instructions can use `AGENTS.md` anywhere in the repository; nearest file takes precedence.
- Copilot also documents root `CLAUDE.md` or `GEMINI.md` as alternatives for agent instructions.

Source: https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/add-custom-instructions/add-repository-instructions

## Gemini CLI

- Default context file is `GEMINI.md`.
- User-level context can live at `~/.gemini/GEMINI.md`.
- Project and ancestor context files are discovered from the current working directory up to the project root or home directory.
- Subdirectory context files can also be discovered, with limits controlled by settings.
- Project configuration lives in `.gemini/settings.json`.

Sources:

- https://github.com/google-gemini/gemini-cli/blob/main/docs/cli/gemini-md.md
- https://github.com/google-gemini/gemini-cli/blob/main/docs/reference/configuration.md

## Practical Recommendation

Use all four native entry points in serious repos:

- `AGENTS.md` for cross-agent behavior.
- `CLAUDE.md` for Claude Code memory and imports.
- `GEMINI.md` for Gemini CLI context.
- `.github/copilot-instructions.md` for Copilot Chat, review, and cloud agent.

Keep the core rule set duplicated only where necessary. For long-lived guidance, store the canonical copy under `ai/shared/` and have native adapters point to it. For critical rules that an agent must follow even if it does not chase references, repeat a short version directly in the native file.
