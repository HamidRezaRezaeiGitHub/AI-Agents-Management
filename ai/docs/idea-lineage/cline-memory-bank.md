# Cline Memory Bank Adoption Assessment

Source: [Cline Memory Bank](https://docs.cline.bot/features/memory-bank)

Estimated adoption: **about 85%**

## Core Idea

Cline Memory Bank is a structured Markdown documentation system for preserving project context across sessions. It gives the agent a fixed set of project memory files, such as `projectbrief.md`, `productContext.md`, `activeContext.md`, `systemPatterns.md`, `techContext.md`, and `progress.md`, then instructs the agent to read and maintain them so work can resume after context resets.

## Community Feedback Categories

- **Praised: persistent project memory.** The official docs frame Memory Bank as a way to turn a stateless assistant into a persistent development partner by storing project details in regular Markdown files. Source: [Cline Memory Bank docs](https://docs.cline.bot/features/memory-bank).
- **Praised: clear file roles.** The core file set separates project brief, product context, active work, architecture patterns, tech stack, and progress so the agent can rebuild project context predictably. Source: [Cline Memory Bank docs](https://docs.cline.bot/features/memory-bank).
- **Praised: context-window handoff.** The docs pair Memory Bank with `/newtask`, `/smol`, Auto-Compact, and Plan/Act mode so users can shed conversation history without losing important decisions. Source: [Cline Memory Bank docs](https://docs.cline.bot/features/memory-bank).
- **Praised: tool-agnostic pattern.** Community discussion notes that a Memory Bank-like approach can work across Cline, Cursor, Claude, Windsurf, and other tools when the memory is exposed outside one agent runtime. Source: [Cline discussion #1818](https://github.com/cline/cline/discussions/1818).
- **Criticized: repository pollution.** Community discussion proposes MCP-backed memory partly to avoid committing or ignoring `memory-bank/` directories in every project. Source: [Cline discussion #1818](https://github.com/cline/cline/discussions/1818).
- **Criticized: growth and retrieval pressure.** Users discuss whether larger memory banks eventually need vector stores, RAG, scoped files, or other retrieval mechanisms. Sources: [Cline discussion #1818](https://github.com/cline/cline/discussions/1818), [Cline Memory Bank docs](https://docs.cline.bot/features/memory-bank).
- **Criticized: maintenance discipline matters.** The docs warn that Memory Bank files should stay concise, with `activeContext.md` current-only and large files split into linked docs. Source: [Cline Memory Bank docs](https://docs.cline.bot/features/memory-bank).

## Adoption In This Project

`man-agent-ment` strongly adopts the persistent-Markdown-memory idea, but uses a different shape. Instead of a `memory-bank/` folder, installed projects get a `wiki/` with `index.md`, `log.md`, architecture/domain/testing starter pages, and a `wiki-documentation` workflow. For active work, local-only `requirements/<slug>/PLAN.md` and `requirements/<slug>/FINDINGS.md` preserve current scope, decisions, validation, and task-specific discoveries between sessions for agents on the same machine. When cross-machine collaboration is needed, the user can intentionally force-add a single requirement folder in git.

The pack is more explicit than Memory Bank about separating per-requirement memory from durable project knowledge. Requirement-specific notes stay in `FINDINGS.md` until they are stable enough to promote into the wiki. The `requirement-planning` workflow now includes a resume-session checklist that tells agents to read the active plan and findings, verify branch/status, inspect recent diffs and handoff notes, identify the next unfinished checklist item, and avoid repeating completed discovery.

The pack also includes wiki linting and installation/audit scripts. It does not adopt Cline's exact file taxonomy, mandatory "read all memory bank files" instruction, Cline-specific commands, checkpoints, Auto-Compact integration, or `.clineignore` guidance.
