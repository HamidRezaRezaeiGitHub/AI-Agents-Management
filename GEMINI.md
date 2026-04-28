# Gemini CLI Context

This repository is the central management system for AI coding-agent instructions and reusable assets.

Read and follow `ai/shared/agent-operating-contract.md` before making changes here.

## Gemini-Specific Notes

- Before acting on a new request, route it with `packs/default/ai/workflows/workflow-dispatch.md` so quick tasks stay lightweight and larger work gets the right process.
- For standard, large, or risky requirements, follow `packs/default/ai/workflows/requirement-planning.md` and read the local requirement `PLAN.md` before broad source search.
- Keep `GEMINI.md` concise because Gemini CLI loads context files into the model prompt.
- Use `.gemini/settings.json` for project Gemini CLI configuration only when settings are safe to share.
- Use nested `GEMINI.md` files only when a subtree needs different instructions.
- Prefer explicit validation commands and known caveats over broad style preferences.
