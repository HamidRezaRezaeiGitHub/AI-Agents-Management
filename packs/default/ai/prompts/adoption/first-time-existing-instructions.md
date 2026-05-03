# Prompt: First-Time Adoption With Existing Instructions

Use this when the project already has Claude, Copilot, Codex, Gemini, Cursor, README, wiki, or custom agent instructions.

This prompt is a source-repo migration aid. Do not copy `packs/default/ai/prompts/adoption/` into the target project.

```text
Adopt the AI agent instruction pack into this existing project without regressing the current agent experience.

Create a local requirement workspace and feature branch. If the pack was installed into a temporary folder such as `tmp/agent-pack-install/`, compare that folder against the existing project instruction files. If the pack source is available elsewhere, inspect it directly.

Before replacing anything, produce a migration plan that identifies:
- existing instruction files and what each one currently does,
- behavior that must be preserved,
- duplicate or stale instructions to remove,
- project-specific facts that should move into wiki pages,
- generic reusable behavior that should use the pack workflows,
- native target files that should remain short adapters.
- helper scripts that should remain available under `ai/scripts/`.
- adoption prompt files that should stay source-repo-only and not be copied under target `ai/`.

Then migrate carefully. Preserve project-specific commands, testing conventions, CI expectations, and domain guidance. Do not delete existing guidance until it has been copied, merged, or intentionally retired.

Validate by running the adoption audit and any relevant project checks. Summarize what changed and what was preserved.
```
