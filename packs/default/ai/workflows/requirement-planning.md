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
This behavior is a workflow instruction plus automation.

## Trigger

Start or resume a requirement workspace when:

- the user gives a requirement title,
- the user describes a task that will take more than one simple edit,
- switching between agents would benefit from persistent local context,
- planning, investigation, implementation, and validation need to be tracked together.

For tiny one-shot edits, use judgment. Do not create requirement workspaces for trivial commands or purely conversational answers.

## Complexity Routing

Record one complexity level in `PLAN.md`:

- `quick`: skip the requirement workspace unless the user asks. Use concise command execution and make the smallest safe edit.
- `standard`: create the workspace, read `FINDINGS.md` before wiki/source discovery, then plan and implement normally.
- `large`: use the standard flow, plus explicit architecture, testing, CI, and code review checkpoints.
- `risky`: use the large flow, call out safety/privacy/operations risks, and ask before irreversible or production-impacting actions.

If a task grows, update the complexity and explain why. If a workflow is skipped to save tokens, record the reason.

## First Agent Responsibilities

- If the user provides a title, use it; otherwise infer a short descriptive title from the prompt.
- Run the script:
  ```sh
  ai/scripts/start-requirement.sh "Requirement Title"
  ```
- Here are the script behaviors:
  - Converts the title to a slug, i.e. lowercase, spaces to hyphens, remove punctuation except hyphens, and collapse repeated hyphens.
  - Creates or reuses `requirements/<slug>/` as the shared workspace for this requirement. It is committed to the requirement branch so PLAN.md and FINDINGS.md are visible to other agents, in PR review, and across machines.
  - Creates or updates `requirements/<slug>/PLAN.md` and `requirements/<slug>/FINDINGS.md` from templates.
  - Creates or switches to the expected branch, preferring `feature/<slug>` when possible.
- Each non-quick requirement should have a local workspace, and implementation work should not happen directly on `main` or `master`.
- If you observe that the requirement workspace already exists, or the script output indicates it was reused, follow the resuming responsibilities below.
- Take a look at the generated `PLAN.md` template.
- Record complexity using `ai/workflows/workflow-dispatch.md`.
- Detect whether the prompt needs vibe-coding translation using `ai/workflows/vibe-coding-translation.md`.
- Read project orientation, related wiki pages, and source code only when needed for context. Follow `Research And Context Optimization` below.

## Resuming Agent Responsibilities

- Read `requirements/<slug>/PLAN.md` first.
- Read `requirements/<slug>/FINDINGS.md` before wiki, docs, or source discovery.
- Check the current branch against the expected branch recorded in `PLAN.md`.
- Run `git status --short --branch` and inspect relevant uncommitted changes before editing.
- You may run the same requirement command again to re-check branch and file setup, but use `--stay-on-current-branch` to avoid an unsafe branch switch:
  ```sh
  ai/scripts/start-requirement.sh --stay-on-current-branch "Requirement Title"
  ```
- If the branch or files are not set up as expected, investigate and fix the issue before proceeding. Do not continue without a clear workspace setup.
- Read recent diffs, commits, handoff notes, and the next unfinished checklist item before broad source search.
- Avoid redoing completed research or implementation unless the plan says it is stale, blocked, or suspect.
- Update the plan status and `Last modified` before substantial follow-on work.
- Update `FINDINGS.md` when new reusable context is discovered.
- Append decisions, blockers, validation results, review notes, and handoff notes as work progresses.

Treat this as a resume-session checklist, not as permission to re-run full requirement planning from scratch. If the existing plan is too sparse or stale to guide safe work, refresh only the missing sections and explain why.

## All Agents Responsibilities

- Identify and run a safe, reasonably scoped baseline verification. Follow `Baseline Verification At Start` below.
- Ask proportional clarifying questions only for decisions that remain unresolved after the context pass. Follow `Proportional Clarifying Questions` below.
- Update `FINDINGS.md` with reusable context, links, user clarifications, risks, validation clues, and discoveries that future agents should not have to rediscover.
- Fill in the useful parts of `PLAN.md`: request summary, complexity, workflows used or skipped, scope, assumptions, baseline result, implementation steps, validation strategy, decisions, and handoff notes.
- If the request needs vibe-coding translation, record the concrete translation, acceptance criteria, assumptions, and remaining open questions in `PLAN.md`.
- If the request affects boundaries, contracts, data flow, integrations, persistence, public APIs, cross-cutting concerns, security, privacy, or long-term maintainability, consult `ai/workflows/architecture.md` and record the architecture impact in `PLAN.md`.
- Before substantial implementation, update the plan status so another agent can tell whether the work is planning, active, validating, reviewing, blocked, parked, complete, or cancelled.
- Keep detailed reusable context in `FINDINGS.md`; keep `PLAN.md` focused on current status and next actions.

## Research And Context Optimization

- Start from `PLAN.md` and then `FINDINGS.md` before scanning source code.
- When resuming, identify the next unfinished checklist item or handoff note before opening broad source areas.
- Use `FINDINGS.md` as the requirement-specific context cache and first filter for wiki/source lookup.
- Translate non-technical or vibe-style requests before broad source search.
- Read `wiki/index.md` and relevant wiki pages when they exist and the plan, findings, or task scope says durable project context may matter.
- Consult architecture docs and `ai/workflows/architecture.md` for architecture-sensitive work.
- Read documented architecture, testing, CI, and command references before broad code search.
- Search source code only for the part of the requirement being worked on, or similar code areas identified.
- Update `FINDINGS.md` with discoveries that future agents would otherwise need to rediscover.
- Promote durable discoveries from `FINDINGS.md` into the wiki during the requirement or before finishing, using `ai/workflows/wiki-documentation.md`.
- Keep raw logs and large copied outputs out of `PLAN.md`; summarize and link to files when needed.
- Follow `ai/workflows/command-execution.md` when running terminal commands.

## Baseline Verification At Start

Before source edits for `standard`, `large`, or `risky` implementation work:

1. Look for an existing validation command in `AGENTS.md`, `README`, contribution docs, `wiki/`, CI files, package scripts, build files, or task runners.
2. Choose the smallest meaningful baseline that proves the current workspace starts from a known state. Prefer targeted smoke checks over full suites when full validation is slow or noisy.
3. Use `ai/workflows/command-execution.md` to keep outputs concise.
4. Record the command and result in `PLAN.md`.
5. If the baseline fails before any source edits, document it as pre-existing in `PLAN.md` and add useful details to `FINDINGS.md`.
6. If no baseline can be run locally, record why and what CI or manual check would provide equivalent confidence.

If the requirement is to fix the failing baseline or another observed defect, follow `ai/workflows/systematic-debugging.md` before proposing the fix.

Do not block quick tasks on baseline verification unless the quick task itself is a validation request.

## Proportional Clarifying Questions

Ask questions gradually, based on complexity:

- `quick`: ask only if blocked; otherwise use an obvious safe default and continue.
- `standard`: ask up to 1-3 decision-shaping questions after checking `FINDINGS.md`, wiki/docs, and narrow source context.
- `large`: ask a focused batch of 3-7 questions, grouped by decision area.
- `risky`: ask enough questions to resolve safety, data, privacy, security, operations, or irreversible decisions before implementation.

Before asking, answer anything that can be discovered from existing files, wiki pages, CI, tests, or source code. For each user-facing question, include a recommended answer or default. When an interactive input or IDE tool supports multiple-choice questions, use it and put the recommended option first. If no such tool is available, ask concise numbered questions with recommended defaults; for non-blocking questions, document the assumption in `PLAN.md` and keep moving.

Record answered questions, defaults, and assumptions in `PLAN.md`. Put reusable context in `FINDINGS.md`.

## PLAN.md Expectations

`PLAN.md` should stay useful for a human and for any future agent. Keep it concise but current.

The template is a starting point, not a fixed schema. Agents may add, remove, merge, or rename sections to fit the requirement, as long as Markdown remains readable and any project linting still passes.

Prefer sections that answer:

- What is the request?
- What complexity and workflows apply?
- What is included, out of scope, assumed, or still open?
- What context was checked, and where is deeper reusable context recorded?
- What baseline verification was run before source edits?
- What is the current plan, status, and next action?
- What decisions, validation results, review notes, blockers, or handoff notes matter?
- What durable project knowledge changed, and was it promoted to the wiki?

## Requirement Status

Use a concise status value in `PLAN.md` metadata. Recommended statuses are:

- `planning`: context gathering or plan shaping is underway.
- `active`: implementation, investigation, or validation is underway.
- `blocked`: work cannot proceed without a decision, dependency, access, or failing baseline resolution.
- `parked`: intentionally paused and expected to resume later.
- `complete`: requirement is handled and validation/review notes are recorded.
- `cancelled`: requirement will not continue.

These statuses work with `ai/scripts/list-requirements.sh` and `ai/scripts/lint-requirements.sh`. The scripts also map common status variants into conceptual categories with case-insensitive substring matching, so values such as `completed`, `done`, `finished`, or `implemented` are treated as done.

## Quality Planning

For implementation requirements, the plan should identify the likely validation surface before coding:

- Vibe-coding translation needs, using `ai/workflows/vibe-coding-translation.md`.
- Architecture impact, using `ai/workflows/architecture.md`.
- Relevant tests or test areas, using `ai/workflows/testing-quality.md`.
- Debugging approach for bugs, failing tests, regressions, or unexpected behavior, using `ai/workflows/systematic-debugging.md`.
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

## Wiki Maintenance During Requirements

Use `ai/workflows/wiki-documentation.md` throughout the requirement lifecycle:

1. At discovery time, read relevant wiki pages first and capture tentative or task-specific discoveries in `FINDINGS.md`.
2. During implementation and validation, note durable project knowledge that future agents should not rediscover.
3. Before finalizing, decide whether that durable knowledge belongs in existing wiki pages, a new page, or only in `FINDINGS.md`.
4. When the wiki changes, update affected pages, `wiki/index.md`, `wiki/log.md`, and run `ai/scripts/wiki-lint.sh` when available.

If no wiki update is needed, record the reason briefly in `PLAN.md`.