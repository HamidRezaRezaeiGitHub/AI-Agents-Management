# Gemini CLI Context

This repository is the central management system for AI coding-agent instructions and reusable assets.

Read and follow `ai/shared/agent-operating-contract.md` before making changes here.

## Gemini-Specific Notes

- For non-trivial requirements, follow `packs/default/ai/workflows/requirement-planning.md` and read the local requirement `PLAN.md` before broad source search.
- Keep `GEMINI.md` concise because Gemini CLI loads context files into the model prompt.
- Use `.gemini/settings.json` for project Gemini CLI configuration only when settings are safe to share.
- Use nested `GEMINI.md` files only when a subtree needs different instructions.
- Prefer explicit validation commands and known caveats over broad style preferences.
