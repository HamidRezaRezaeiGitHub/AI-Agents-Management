# Gemini CLI Context

This repository, `man-agent-ment`, is the central management system for AI coding-agent instructions and reusable assets.

Read and follow `ai/shared/agent-operating-contract.md` before making changes here.

## Gemini-Specific Notes

- Use `packs/default/ai/workflows/workflow-dispatch.md` first, then read only the workflows this task needs.
- For non-quick work, use `packs/default/ai/workflows/requirement-planning.md`; keep `PLAN.md` for status and `FINDINGS.md` for reusable requirement context.
- For implementation work, record baseline verification when available, validate before finishing, and use the two-pass review.
- Keep `GEMINI.md` concise because Gemini CLI loads context files into the model prompt.
- Use `.gemini/settings.json` for project Gemini CLI configuration only when settings are safe to share.
- Use nested `GEMINI.md` files only when a subtree needs different instructions.
- Prefer explicit validation commands and known caveats over broad style preferences.
