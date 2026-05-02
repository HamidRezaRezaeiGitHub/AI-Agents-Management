---
name: requirement-planning
use_when: Starting or resuming a standard, large, or risky requirement, feature, bug fix, refactor, investigation, or multi-step documentation task.
reads:
  - ai/workflows/workflow-dispatch.md
  - requirements/<slug>/PLAN.md
  - requirements/<slug>/FINDINGS.md
  - wiki/index.md
writes:
  - requirements/<slug>/PLAN.md
  - requirements/<slug>/FINDINGS.md
strictness: required_for_non_quick_work
---

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

Before starting, use `ai/workflows/workflow-dispatch.md` to classify the request as `quick`, `standard`, `large`, or `risky`. Only `standard`, `large`, and `risky` requests need this workflow by default.

## Complexity Routing

Record one complexity level in `PLAN.md`:

- `quick`: skip the requirement workspace unless the user asks. Use concise command execution and make the smallest safe edit.
- `standard`: create the workspace, read `FINDINGS.md` before wiki/source discovery, then plan and implement normally.
- `large`: use the standard flow, plus explicit architecture, testing, CI, and code review checkpoints.
- `risky`: use the large flow, call out safety/privacy/operations risks, and ask before irreversible or production-impacting actions.

If a task grows, update the complexity and explain why. If a workflow is skipped to save tokens, record the reason.

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
- By default, `ai/scripts/start-requirement.sh` creates or switches to the expected requirement branch.
- When already on a suitable feature branch for the active work, an agent may run `ai/scripts/start-requirement.sh --stay-on-current-branch "Title"` to create or resume the workspace without switching branches.
- Record the expected branch in `PLAN.md`.
- If resuming, compare the current branch with the expected branch and switch or ask before continuing when the mismatch is unsafe.

## First Agent Responsibilities

When no workspace exists for the requirement:

1. Create the workspace.
2. Add `requirements/` to `.gitignore`.
3. Create the feature branch.
4. Create `PLAN.md` from the template as a scaffold.
5. Create `FINDINGS.md` from the template as the requirement-specific context cache.
6. Record complexity using `ai/workflows/workflow-dispatch.md`.
7. Detect whether the prompt needs vibe-coding translation using `ai/workflows/vibe-coding-translation.md`.
8. Read any existing content in `FINDINGS.md` before wiki/source discovery.
9. Read only the wiki/docs and source areas suggested by findings and the requirement.
10. Update `FINDINGS.md` with reusable context, links, user clarifications, risks, and validation clues.
11. Ask proportional clarifying questions only for decisions that remain unresolved after the context pass.
12. Identify and run a safe, reasonably scoped baseline verification before source edits, or record why it cannot be run.
13. Fill in the useful plan after that context pass: summary, complexity, translation when needed, scope, clarifications, context strategy, baseline result, validation strategy, and implementation steps.
14. Include architecture impact using `ai/workflows/architecture.md` when boundaries, data flow, contracts, or cross-cutting concerns may change.

Prefer using:

```sh
ai/scripts/start-requirement.sh "Requirement Title"
```

Use `--stay-on-current-branch` only when the current branch is already the right feature branch for the work.

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

`PLAN.md` should stay useful for a human and for any future agent. Keep it concise but current. The template is a starting point, not a fixed schema; agents may add, remove, or rename sections to fit the requirement as long as Markdown remains readable and any project linting still passes.

Include only sections that help the current requirement:

- requirement title and slug,
- expected branch,
- status,
- link to `FINDINGS.md`,
- prompt summary,
- complexity and routing decisions,
- vibe-coding translation when relevant,
- clarifying questions and decisions,
- assumptions,
- scope and non-goals,
- context strategy,
- architecture impact,
- baseline verification,
- plan checklist,
- testing strategy,
- CI/validation strategy,
- code review strategy,
- decisions,
- validation,
- handoff notes.

## Context And Token Optimization

- Start from `PLAN.md` and then `FINDINGS.md` before scanning source code.
- Use the chosen complexity to avoid reading unnecessary workflows or source areas.
- Use `FINDINGS.md` as the requirement-specific context cache and first filter for wiki/source lookup.
- Translate non-technical or vibe-style requests before broad source search.
- Read `wiki/index.md` and relevant wiki pages when they exist.
- Consult architecture docs and `ai/workflows/architecture.md` for architecture-sensitive work.
- Read documented architecture, testing, CI, and command references before broad code search.
- Fill in the detailed implementation plan after reading the relevant wiki/docs and narrowly required source context.
- Run a baseline verification before implementation when the chosen complexity is `standard`, `large`, or `risky` and a safe command can be identified.
- Search source code only for the part of the requirement being worked on.
- Update `FINDINGS.md` with discoveries that future agents would otherwise need to rediscover.
- Keep `PLAN.md` focused on control flow, decisions, validation, and status.
- Keep raw logs and large copied outputs out of `PLAN.md`; summarize and link to files when needed.
- Follow `ai/workflows/command-execution.md` when running terminal commands.

## Proportional Clarifying Questions

Ask questions gradually, based on complexity:

- `quick`: ask only if blocked; otherwise use an obvious safe default and continue.
- `standard`: ask up to 1-3 decision-shaping questions after checking `FINDINGS.md`, wiki/docs, and narrow source context.
- `large`: ask a focused batch of 3-7 questions, grouped by decision area.
- `risky`: ask enough questions to resolve safety, data, privacy, security, operations, or irreversible decisions before implementation.

Before asking, answer anything that can be discovered from existing files, wiki pages, CI, tests, or source code. For each user-facing question, include a recommended answer or default. When an interactive input or IDE tool supports multiple-choice questions, use it and put the recommended option first. If no such tool is available, ask concise numbered questions with recommended defaults; for non-blocking questions, document the assumption in `PLAN.md` and keep moving.

Record answered questions, defaults, and assumptions in `PLAN.md`. Put reusable context in `FINDINGS.md`.

## Quality Planning

For implementation requirements, the plan should identify the likely validation surface before coding:

- Vibe-coding translation needs, using `ai/workflows/vibe-coding-translation.md`.
- Architecture impact, using `ai/workflows/architecture.md`.
- Relevant tests or test areas, using `ai/workflows/testing-quality.md`.
- CI expectations, using `ai/workflows/ci-validation.md`.
- Final self-review or PR-review needs, using `ai/workflows/code-review.md`.
- Wiki pages that may need updates, using `ai/workflows/wiki-documentation.md`.

If a project lacks explicit commands, inspect CI configuration, package scripts, build files, and wiki/docs before deciding what to run.

## Baseline Verification At Start

Before source edits for `standard`, `large`, or `risky` implementation work:

1. Look for an existing validation command in `AGENTS.md`, `README`, contribution docs, `wiki/`, CI files, package scripts, build files, or task runners.
2. Choose the smallest meaningful baseline that proves the current workspace starts from a known state. Prefer targeted smoke checks over full suites when full validation is slow or noisy.
3. Use `ai/workflows/command-execution.md` to keep output concise.
4. Record the command and result in `PLAN.md`.
5. If the baseline fails before any source edits, document it as pre-existing in `PLAN.md` and add useful details to `FINDINGS.md`.
6. If no baseline can be run locally, record why and what CI or manual check would provide equivalent confidence.

Do not block quick tasks on baseline verification unless the quick task itself is a validation request.

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
