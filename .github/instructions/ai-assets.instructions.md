---
applyTo: "ai/**,packs/**,.claude/**,.gemini/**,.github/**,AGENTS.md,CLAUDE.md,GEMINI.md"
---

# AI Asset Instructions

- Treat instruction files as product surface area: concise, deterministic, and easy to audit.
- Avoid duplicating long guidance across agent-specific files. Prefer short adapters that point to the shared contract.
- When a tool cannot import or follow references reliably, include the critical behavior directly in that tool's native file.
- Include source links in docs when describing external agent behavior.
- For dispatcher and planning-workflow changes, keep the canonical installable behavior in `packs/default/ai/workflows/workflow-dispatch.md` and `packs/default/ai/workflows/requirement-planning.md`, and keep native adapters short.
- For skill changes, keep canonical portable behavior in `packs/default/ai/skills/<skill>/SKILL.md`; keep agent-native skill or instruction files thin and pointed at the canonical skill.
- For wiki-documentation changes, keep the canonical installable behavior in `packs/default/ai/workflows/wiki-documentation.md`.
- For command, CI, and testing guidance, keep project-agnostic behavior in `packs/default/ai/workflows/` and avoid technology-specific commands.
- For vibe-coding translation, keep behavior project-agnostic and focused on clarifying intent before implementation.
- For architecture guidance, keep behavior focused on current system boundaries, data flow, contracts, decisions, and wiki documentation.
- For code review guidance, prioritize behavioral defects, architecture fit, tests, CI, security/privacy, operations, and documentation drift over style.
- For requirement handoff changes, keep `PLAN.md` focused on control flow and `FINDINGS.md` focused on reusable requirement-specific context.
