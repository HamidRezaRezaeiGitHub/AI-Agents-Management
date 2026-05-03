# Prompt: Update Existing Pack Installation

Use this when the project already adopted an older version of the pack.

This prompt is a source-repo migration aid. Do not copy `packs/default/ai/prompts/adoption/` into the target project.

```text
Update this project's AI agent instruction pack to the current version.

Start by reading `ai/pack.yaml`, `ai/README.md`, existing native instruction files, `ai/workflows/`, and project wiki guidance. Run the adoption audit if available. Compare the installed files with the current pack source.

Create a local requirement workspace and feature branch. Prepare a short upgrade plan that separates:
- pack changes that should be accepted,
- local project customizations that must be preserved,
- obsolete files or rules that should be removed,
- old installed `ai/prompts/adoption/` files that should be removed because adoption prompts are source-repo-only,
- docs/wiki updates needed after the upgrade.

Apply the update without overwriting project-specific facts. Preserve validated project commands, CI expectations, testing conventions, and domain guidance.

After updating, run `ai/scripts/audit-adoption.sh`, `ai/scripts/wiki-lint.sh` if a wiki exists, and the relevant project validation checks discovered from CI/docs.
```
