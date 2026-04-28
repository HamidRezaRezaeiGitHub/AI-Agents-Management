# Requirement Planning Workflow

Use this workflow at the beginning of any non-trivial requirement, feature, bug fix, refactor, investigation, or multi-step documentation task.

## Classification

This behavior is a workflow instruction plus automation:

- Instruction: agents need to know when and why to use it.
- Script: branch, directory, and template creation should be deterministic.
- Hook: teams may optionally block accidental commits of local requirement workspaces.
- Skill: only needed later if the workflow grows into a larger planning capability with references, scripts, and examples.

## Trigger

Start or resume a requirement workspace when:

- the user gives a requirement title,
- the user describes a task that will take more than one simple edit,
- switching between agents would benefit from persistent local context,
- planning, investigation, implementation, and validation need to be tracked together.

For tiny one-shot edits, use judgment. Do not create requirement workspaces for trivial commands or purely conversational answers.

## Title And Slug

- If the user provides a title, use it.
- If no title is provided, infer a short descriptive title from the prompt.
- Convert the title to a filesystem-safe slug:
  - lowercase,
  - spaces to hyphens,
  - remove punctuation except hyphens,
  - collapse repeated hyphens.

Example:

- Title: `Requirement Planning Workflow`
- Slug: `requirement-planning-workflow`

## Local Workspace

- Ensure a root-level `requirements/` directory exists.
- Ensure `requirements/` is listed in `.gitignore`.
- Create or reuse `requirements/<slug>/`.
- Create or update `requirements/<slug>/PLAN.md`.
- Create or update `requirements/<slug>/FINDINGS.md`.
- Treat `requirements/<slug>/` as the temporary local workspace for this requirement.
- Do not commit files under `requirements/`.

## Branch

- Do not work directly on `main` or `master` for implementation work.
- Use a branch named from the requirement slug.
- Prefer `feature/<slug>` when possible.
- If that ref shape is blocked or the local repo disallows slash branches, use `<slug>`.
- Record the expected branch in `PLAN.md`.
- If resuming, compare the current branch with the expected branch and switch or ask before continuing when the mismatch is unsafe.

## First Agent Responsibilities

When no workspace exists for the requirement:

1. Create the workspace.
2. Add `requirements/` to `.gitignore`.
3. Create the feature branch.
4. Create `PLAN.md` from the template as a scaffold.
5. Create `FINDINGS.md` from the template as the requirement-specific context cache.
6. Detect whether the prompt needs vibe-coding translation using `ai/workflows/vibe-coding-translation.md`.
7. Read any existing content in `FINDINGS.md` before wiki/source discovery.
8. Read only the wiki/docs and source areas suggested by findings and the requirement.
9. Update `FINDINGS.md` with reusable context, links, user clarifications, risks, and validation clues.
10. Fill in the useful plan after that context pass: prompt summary, translation when needed, assumptions, scope, non-goals, context strategy, testing strategy, validation strategy, and implementation steps.
11. Include architecture impact using `ai/workflows/architecture.md` when boundaries, data flow, contracts, or cross-cutting concerns may change.

Prefer using:

```sh
ai/scripts/start-requirement.sh "Requirement Title"
```

## Resuming Agent Responsibilities

When the workspace already exists:

1. Read `requirements/<slug>/PLAN.md` first.
2. Read `requirements/<slug>/FINDINGS.md` when it exists.
3. Check the current branch against the expected branch in the plan.
4. Review the context, testing, and validation sections before broad source search.
5. Update `FINDINGS.md` when new reusable context is discovered.
6. Update the plan with current status before making substantial changes.
7. Append decisions, blockers, validation results, and handoff notes as work progresses.

## PLAN.md Expectations

`PLAN.md` should stay useful for a human and for any future agent. Keep it concise but current.

Include:

- requirement title and slug,
- expected branch,
- status,
- link to `FINDINGS.md`,
- prompt summary,
- vibe-coding translation when relevant,
- assumptions,
- scope and non-goals,
- context strategy,
- architecture impact,
- plan checklist,
- testing strategy,
- CI/validation strategy,
- code review strategy,
- decisions,
- validation,
- handoff notes.

## Context And Token Optimization

- Start from `PLAN.md` and then `FINDINGS.md` before scanning source code.
- Use `FINDINGS.md` as the requirement-specific context cache and first filter for wiki/source lookup.
- Translate non-technical or vibe-style requests before broad source search.
- Read `wiki/index.md` and relevant wiki pages when they exist.
- Consult architecture docs and `ai/workflows/architecture.md` for architecture-sensitive work.
- Read documented architecture, testing, CI, and command references before broad code search.
- Fill in the detailed implementation plan after reading the relevant wiki/docs and narrowly required source context.
- Search source code only for the part of the requirement being worked on.
- Update `FINDINGS.md` with discoveries that future agents would otherwise need to rediscover.
- Keep `PLAN.md` focused on control flow, decisions, validation, and status.
- Keep raw logs and large copied outputs out of `PLAN.md`; summarize and link to files when needed.
- Follow `ai/workflows/command-execution.md` when running terminal commands.

## Quality Planning

For implementation requirements, the plan should identify the likely validation surface before coding:

- Vibe-coding translation needs, using `ai/workflows/vibe-coding-translation.md`.
- Architecture impact, using `ai/workflows/architecture.md`.
- Relevant tests or test areas, using `ai/workflows/testing-quality.md`.
- CI expectations, using `ai/workflows/ci-validation.md`.
- Final self-review or PR-review needs, using `ai/workflows/code-review.md`.
- Wiki pages that may need updates, using `ai/workflows/wiki-documentation.md`.

If a project lacks explicit commands, inspect CI configuration, package scripts, build files, and wiki/docs before deciding what to run.

## FINDINGS.md Expectations

`FINDINGS.md` should capture requirement-specific knowledge that is useful but too detailed for `PLAN.md`.

Use it for:

- relevant wiki/docs links and why they matter,
- relevant source files, classes, methods, tests, configs, or commands,
- user clarifications and back-and-forth decisions,
- investigation notes,
- risks and open questions,
- validation clues.

Do not duplicate stable project knowledge from the wiki. Link to it and summarize the requirement-specific relevance.

## Suggested Improvements

- Add a repository-level documentation index such as `docs/INDEX.md` in projects with substantial docs.
- Add a project-specific `docs/architecture.md` or equivalent when agents repeatedly need the same orientation.
- Add CI or hooks for enforceable policies, but keep local requirement planning files ignored.
- Consider turning this into a full skill later if the workflow gains examples, scripts, and richer planning templates.
