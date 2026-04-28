---
applyTo: "ai/**,.claude/**,.gemini/**,.github/**,AGENTS.md,CLAUDE.md,GEMINI.md"
---

# AI Asset Instructions

- Treat instruction files as product surface area: concise, deterministic, and easy to audit.
- Avoid duplicating long guidance across agent-specific files. Prefer short adapters that point to the shared contract.
- When a tool cannot import or follow references reliably, include the critical behavior directly in that tool's native file.
- Include source links in docs when describing external agent behavior.
- For planning-workflow changes, keep the canonical installable behavior in `packs/default/ai/workflows/requirement-planning.md` and keep native adapters short.
