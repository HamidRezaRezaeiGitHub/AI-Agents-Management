# Prompt: First-Time Adoption With Existing Instructions

Use this when the project already has Claude, Copilot, Codex, Gemini, Cursor, README, wiki, or custom agent instructions.

```text
Adopt the AI agent instruction pack into this existing project without regressing the current agent experience.

Create a local requirement workspace and feature branch. Install the pack into a temporary folder inside this repo, such as `tmp/agent-pack-install/`, or inspect the pack source if it is already available. Compare the pack files against the existing project instruction files.

Before replacing anything, produce a migration plan that identifies:
- existing instruction files and what each one currently does,
- behavior that must be preserved,
- duplicate or stale instructions to remove,
- project-specific facts that should move into wiki pages,
- generic reusable behavior that should use the pack workflows,
- native target files that should remain short adapters.

Then migrate carefully. Preserve project-specific commands, testing conventions, CI expectations, and domain guidance. Do not delete existing guidance until it has been copied, merged, or intentionally retired.

Validate by running the adoption audit and any relevant project checks. Summarize what changed and what was preserved.
```
