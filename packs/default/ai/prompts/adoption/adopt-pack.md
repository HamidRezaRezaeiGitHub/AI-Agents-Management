# Prompt: Adopt Pack Into A Project

Use this in the target project when adopting `man-agent-ment` for the first time, whether or not the project already has agent instructions, docs, wiki pages, or requirement notes.

This prompt is a source-repo migration aid. Paste it into an agent session running at the target project root. Do not copy `packs/default/ai/prompts/adoption/` into the target project.

```text
Adopt the `man-agent-ment` AI-agent instruction pack into this project.

Pack source URL:
https://github.com/HamidRezaRezaeiGitHub/man-agent-ment.git

Work in analysis-and-planning mode first. Do not immediately overwrite existing instructions, docs, source files, wiki pages, or requirement files.

Start by cloning the pack source into a temporary folder inside this project, for example `tmp/man-agent-ment-pack/`. Keep that temporary clone out of commits and remove it or leave it ignored when finished.

Recommended setup:

    TARGET_ROOT=$(pwd)
    PACK_TEMP=tmp/man-agent-ment-pack
    git clone https://github.com/HamidRezaRezaeiGitHub/man-agent-ment.git "$PACK_TEMP"

Then inspect what the installer would do without writing files:

    (cd "$PACK_TEMP" && scripts/install-adapter.sh --dry-run "$TARGET_ROOT")

Treat every `skip existing ...` line as a manual migration item. The installer will not overwrite those files, so compare each skipped target file with the pack source and decide whether to preserve the local version, merge selected pack changes, or replace it intentionally.

Evaluate the pack before applying it:
- read the pack README and `packs/default/README.md`,
- read `packs/default/root/AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, and `.github/` instruction files,
- read `packs/default/ai/README.md` and the workflows under `packs/default/ai/workflows/`,
- inspect `scripts/install-adapter.sh` and `scripts/audit-adoption.sh`,
- identify every file and directory that would be added to this project.

Now analyze this target project:
- existing agent instruction files such as `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.github/copilot-instructions.md`, Cursor rules, or custom prompts,
- existing README, contributing docs, architecture docs, ADRs, wiki/docs folders, and operational notes,
- package/build files, CI configuration, scripts, test setup, and validation commands,
- branching strategy, naming conventions, PR/review expectations, and release practices,
- existing `requirements/`, planning documents, TODO trackers, issue templates, or similar requirement records,
- source layout and major architecture areas at a high level.

Prepare a staged migration plan before making broad changes. The plan should explain:
- which pack files can be installed as-is,
- which existing instructions should be removed because the pack covers them,
- which existing instructions should remain as project-specific guidance,
- where preserved project-specific guidance should live after adoption, such as `AGENTS.md`, `ai/README.md`, workflow notes, or wiki pages,
- whether existing docs/wiki content should be migrated into the pack wiki pattern,
- whether existing requirement notes should be migrated toward `requirements/<slug>/PLAN.md` and `FINDINGS.md`,
- project-specific branching or naming conventions that should be reflected in the adopted instructions,
- missing project knowledge the migration should add, such as wiki pages, testing guidance, CI expectations, architecture notes, or known gotchas,
- safe validation commands to run before and after migration,
- which work should happen now and which parts should be staged for later requirements.

Use a local requirement workspace for the adoption plan when appropriate. If the project has an existing branch strategy, follow it instead of assuming `feature/<slug>`.

While working on the plan, use `ai/skills/interview-questions/SKILL.md` if important decisions would benefit from user input. Do not ask broad interview questions about the project that could be answered by reading the repo or that would require a deep dive into the codebase. Include a comparison and your preferred option before asking each question.

After the plan is clear, ask for confirmation before performing broad migration steps. It is acceptable to complete only the analysis and staged plan in this first pass. Do not invent project facts, do not add secrets or machine-specific paths, and do not change application behavior.
```
