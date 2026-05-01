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

Use a concise status value in `PLAN.md` metadata. Recommended statuses are:

- `planning`: context gathering or plan shaping is underway.
- `active`: implementation, investigation, or validation is underway.
- `blocked`: work cannot proceed without a decision, dependency, access, or failing baseline resolution.
- `parked`: intentionally paused and expected to resume later.
- `complete`: requirement is handled and validation/review notes are recorded.
- `cancelled`: requirement will not continue.

These statuses are designed to work with `ai/scripts/list-requirements.sh` and `ai/scripts/lint-requirements.sh`. The scripts also map common status variants into conceptual categories with case-insensitive substring matching, so values such as `completed`, `done`, `finished`, or `implemented` are treated as done.

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
6. Record complexity using `ai/workflows/workflow-dispatch.md`.
7. Detect whether the prompt needs vibe-coding translation using `ai/workflows/vibe-coding-translation.md`.
8. Read any existing content in `FINDINGS.md` before wiki/source discovery.
9. Read only the wiki/docs and source areas suggested by findings and the requirement.
10. Update `FINDINGS.md` with reusable context, links, user clarifications, risks, and validation clues.
11. Ask proportional clarifying questions only for decisions that remain unresolved after the context pass.
12. Identify and run a safe, reasonably scoped baseline verification before source edits, or record why it cannot be run.
13. Identify whether discovered knowledge is requirement-local or durable project knowledge, and record any needed wiki updates in `PLAN.md`.
14. Fill in the useful plan after that context pass: summary, complexity, translation when needed, scope, clarifications, context strategy, wiki maintenance, baseline result, validation strategy, and implementation steps.
15. Include architecture impact using `ai/workflows/architecture.md` when boundaries, data flow, contracts, or cross-cutting concerns may change.

Prefer using:

```sh
ai/scripts/start-requirement.sh "Requirement Title"
```

## Resuming Agent Responsibilities

When the workspace already exists, recover context before restarting discovery or implementation:

1. Read `requirements/<slug>/PLAN.md` first.
2. Read `requirements/<slug>/FINDINGS.md` when it exists.
3. Check the current branch against the expected branch in the plan.
4. Run `git status --short --branch` and inspect relevant uncommitted changes before editing.
5. Read recent diffs, commits, handoff notes, and the next unfinished checklist item before broad source search.
6. Read `wiki/index.md` only when the plan, findings, or task scope says durable project context may matter.
7. Review the plan's context, baseline, testing, validation, and code-review sections before choosing new commands.
8. Avoid redoing completed research or implementation unless the plan says it is stale, blocked, or suspect.
9. Update the plan with current status and `Last modified` before substantial follow-on work.
10. Update `FINDINGS.md` when new reusable context is discovered.
11. Append decisions, blockers, validation results, and handoff notes as work progresses.

Treat this as a resume-session checklist, not as permission to re-run full requirement planning from scratch. If the existing plan is too sparse or stale to guide safe work, refresh only the missing sections and explain why.

## PLAN.md Expectations

`PLAN.md` should stay useful for a human and for any future agent. Keep it concise but current.

Include only sections that help the current requirement:

- requirement title and slug,
- expected branch,
- created, last modified, and status,
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
- wiki maintenance,
- code review strategy,
- decisions,
- validation,
- handoff notes.

## Context And Token Optimization

- Start from `PLAN.md` and then `FINDINGS.md` before scanning source code.
- When resuming, identify the next unfinished checklist item or handoff note before opening broad source areas.
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
- Promote durable discoveries from `FINDINGS.md` into the wiki during the requirement or before finishing, using `ai/workflows/wiki-documentation.md`.
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
- Wiki pages that may need updates, using `ai/workflows/wiki-documentation.md`; wiki maintenance is expected when durable project knowledge changes.

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

## Wiki Maintenance During Requirements

Use `ai/workflows/wiki-documentation.md` throughout the requirement lifecycle:

1. At discovery time, read relevant wiki pages first and capture tentative or task-specific discoveries in `FINDINGS.md`.
2. During implementation and validation, note durable project knowledge that future agents should not rediscover.
3. Before finalizing, decide whether that durable knowledge belongs in existing wiki pages, a new page, or only in `FINDINGS.md`.
4. When the wiki changes, update affected pages, `wiki/index.md`, `wiki/log.md`, and run `ai/scripts/wiki-lint.sh` when available.

If no wiki update is needed, record the reason briefly in `PLAN.md`.

## Suggested Improvements

- Add a repository-level documentation index such as `docs/INDEX.md` in projects with substantial docs.
- Add a project-specific `docs/architecture.md` or equivalent when agents repeatedly need the same orientation.
- Add CI or hooks for enforceable policies, but keep local requirement planning files ignored.
- Consider turning this into a full skill later if the workflow gains examples, scripts, and richer planning templates.
