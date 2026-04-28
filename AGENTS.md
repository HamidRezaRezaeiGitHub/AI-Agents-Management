# AGENTS.md

## Purpose

This repository manages portable instructions, skills, hooks, commands, and agent definitions for AI coding assistants across projects.

## Agent Contract

Follow `ai/shared/agent-operating-contract.md` when working in this repo. Treat it as the source of truth for shared behavior unless a direct user instruction conflicts with it.

## Repository Map

- `ai/shared/` contains canonical shared instructions.
- `ai/docs/` contains research notes, discovery matrices, and adoption guidance.
- `packs/default/` contains files intended to be copied into other repositories.
- `ai/skills/` stores portable skill packages or skill design notes.
- `ai/hooks/` stores hook designs and reusable hook scripts.
- `ai/commands/` stores slash-command and prompt-command assets.
- `ai/agents/` stores reusable subagent definitions.
- `.github/`, `.claude/`, and `.gemini/` contain native adapters for specific tools.
- `scripts/` contains adoption and maintenance scripts.

## Work Rules

- Before acting on a new request, route it with `packs/default/ai/workflows/workflow-dispatch.md` so quick tasks stay lightweight and larger work gets the right process.
- For standard, large, or risky requirements, follow `packs/default/ai/workflows/requirement-planning.md` before implementation.
- For implementation work, record a safe baseline verification in `PLAN.md` before source edits when one is available.
- Keep instructions concise, concrete, and non-task-specific.
- Prefer one canonical shared instruction with thin native adapters.
- Do not put secrets, local machine paths, tokens, or private customer data in committed instructions.
- When adding guidance for a command, verify the command or mark it as unverified.
- Before finalizing source changes, use the two-pass review in `packs/default/ai/workflows/code-review.md`.
- When adding an agent-specific file, document whether it is auto-discovered, manually invoked, or copied by script.
- Preserve portability across macOS, Linux, and Windows unless a file is explicitly platform-specific.

## Validation

This repo currently has no build system. For documentation-only changes, validate by checking links, Markdown readability, and shell script syntax when scripts change:

```sh
sh -n scripts/install-adapter.sh
sh -n scripts/audit-adoption.sh
sh -n packs/default/ai/scripts/start-requirement.sh
sh -n packs/default/ai/scripts/audit-adoption.sh
sh -n packs/default/ai/scripts/wiki-lint.sh
```
