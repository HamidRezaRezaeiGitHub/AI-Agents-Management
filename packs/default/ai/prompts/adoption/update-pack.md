# Prompt: Update Existing Pack Installation

Use this in a target project that already adopted an older `man-agent-ment` pack.

This prompt is a source-repo migration aid. Paste it into an agent session running at the target project root. Do not copy `packs/default/ai/prompts/adoption/` into the target project.

```text
Update this project's existing `man-agent-ment` AI-agent instruction pack.

Pack source URL:
https://github.com/HamidRezaRezaeiGitHub/man-agent-ment.git

Work in analysis-and-planning mode first. Do not immediately overwrite local customizations.

Start by reading the current installed pack state:
- `ai/pack.yaml`,
- `ai/README.md`,
- native instruction files such as `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.github/copilot-instructions.md`, and `.github/instructions/`,
- installed `ai/workflows/`, `ai/scripts/`, `ai/templates/`, hooks, and wiki starter files,
- project-specific wiki/docs, requirement workspaces, CI config, scripts, and validation commands.

Clone the current pack source into a temporary folder inside this project, for example `tmp/man-agent-ment-pack/`. Keep that temporary clone out of commits and remove it or leave it ignored when finished.

Recommended setup:

    TARGET_ROOT=$(pwd)
    PACK_TEMP=tmp/man-agent-ment-pack
    git clone https://github.com/HamidRezaRezaeiGitHub/man-agent-ment.git "$PACK_TEMP"

Then inspect the current pack source and preview install behavior:

    (cd "$PACK_TEMP" && scripts/install-adapter.sh --dry-run "$TARGET_ROOT")

Treat every `skip existing ...` line as a manual migration item. The installer will not overwrite those files, so compare each skipped target file with the pack source and decide whether to preserve the local customization, merge selected pack changes, or replace it intentionally.

Compare the installed pack version with the source pack version. The installer never overwrites existing files, so the target's `ai/pack.yaml` will keep its old version even after files are updated. Read both and decide whether the update applies:

    grep '^version:' ai/pack.yaml
    grep '^version:' "$PACK_TEMP/packs/default/ai/pack.yaml"

If the source version is newer, plan to bump the target's `ai/pack.yaml` version field as part of the update so the recorded version matches what was installed. If they match, no version bump is needed.

Compare the installed project files with the cloned pack source:
- identify pack files that changed and should be accepted,
- identify local project customizations that must be preserved,
- identify obsolete files, old copied adoption prompts, duplicate instructions, or stale rules that should be removed,
- identify docs, wiki pages, requirement files, or scripts that need migration to the current pack pattern,
- identify target-project branching, naming, testing, CI, or review conventions that should remain project-specific,
- inspect the update impact of any new workflows, scripts, templates, hooks, or wiki guidance.

Prepare a staged update plan before making broad changes. The plan should separate:
- safe mechanical pack updates,
- files requiring careful merge,
- project-specific guidance that should be moved into `AGENTS.md`, `ai/README.md`, workflow notes, or wiki pages,
- existing documentation or requirement records that should be migrated,
- missing wiki/testing/CI/architecture guidance discovered during review,
- validation commands to run before and after each stage,
- work that should be deferred to follow-up requirements.

Use a local requirement workspace for the update plan when appropriate. If this project follows a specific branching strategy, follow it instead of assuming `feature/<slug>`.

While working on the plan, use `ai/skills/interview-questions/SKILL.md` if important decisions would benefit from user input. Do not ask broad interview questions about the project that could be answered by reading the repo or that would require a deep dive into the codebase. Include a comparison and your preferred option before asking each question.

After the plan is clear, ask for confirmation before applying broad updates. It is acceptable to complete only the analysis and staged plan in this first pass. Preserve validated project commands, CI expectations, testing conventions, domain guidance, secrets safety, and application behavior.
```
