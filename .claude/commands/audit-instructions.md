---
description: Audit this repository's agent instruction files for drift, duplication, and missing validation details.
---

# Audit Agent Instructions

Review `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.github/copilot-instructions.md`, `.github/instructions/`, and `ai/`.

Check for:

- stale commands,
- duplicated long guidance,
- missing validation steps,
- unclear precedence,
- secrets or local-only values,
- rules that should be hooks or CI checks instead of prose.

Return findings first, with file paths and specific suggested edits.
