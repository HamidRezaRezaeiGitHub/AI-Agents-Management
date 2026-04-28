# Gemini CLI Context

Follow `AGENTS.md` for project instructions.

## Gemini Notes

- For the workflow map, read `ai/README.md`.
- Before acting on a new request, route it with `ai/workflows/workflow-dispatch.md` so quick tasks stay lightweight and larger work gets the right process.
- For standard, large, or risky requirements, follow `ai/workflows/requirement-planning.md` and read `requirements/<slug>/PLAN.md` when resuming.
- For implementation work, record a safe baseline verification in `PLAN.md` before source edits when one is available.
- Use `requirements/<slug>/FINDINGS.md` to share requirement-specific discoveries between agents.
- For non-developer or vibe-style requests, translate first with `ai/workflows/vibe-coding-translation.md`.
- For project orientation, read `wiki/index.md` when it exists and follow `ai/workflows/wiki-documentation.md` for wiki updates.
- For architecture-sensitive work, consult `ai/workflows/architecture.md` and relevant `wiki/architecture/` pages.
- Use concise terminal output per `ai/workflows/command-execution.md`.
- Before finishing implementation work, follow `ai/workflows/ci-validation.md`.
- When working on tests, follow `ai/workflows/testing-quality.md`.
- Before finalizing source changes or reviewing a PR, follow `ai/workflows/code-review.md`.
- Keep this file concise.
- Add nested `GEMINI.md` files only when a subtree needs different rules.
- Use `.gemini/settings.json` only for safe team-shared Gemini CLI settings.
