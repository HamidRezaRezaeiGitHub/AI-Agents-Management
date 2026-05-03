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
  - Converts the title to a slug, i.e. lowercase, spaces to hyphens, remove punctuation except hyphens, and collapse repeated hyphens;
  - Creates (or reuses) `requirements/<slug>/`, adds it to `.gitignore`; Treat `requirements/<slug>/` as the temporary local workspace for this requirement.
  - Creates (or updates) `requirements/<slug>/PLAN.md` and `requirements/<slug>/FINDINGS.md` from templates;
  - Creates (or switches to) the expected branch, preferring `feature/<slug>` when possible;
- Each non-quick requirement should have a local workspace, and you are expected to not work directly on `main` or `master` branch for implementation work. If you observe that the requirement workspace already exists, or the script's output indicates it was reused, follow the resuming agent responsibilities below.
- Take a look at the generated `PLAN.md` template.
- Record complexity using `ai/workflows/workflow-dispatch.md`.
- Detect whether the prompt needs vibe-coding translation using `ai/workflows/vibe-coding-translation.md`.
- Read the project orientation, related wiki pages, and the source code when needed for context. Follow `Research and Context Optimization` guidelines below.

## Resuming Agent Responsibilities

- You may run the same command again to re-check the branch and file setup, but use `--stay-on-current-branch` to avoid an unsafe branch switch:
  ```sh
  ai/scripts/start-requirement.sh --stay-on-current-branch "Requirement Title"
  ```
- If the branch or files are not set up as expected, investigate and fix the issue before proceeding. Do not continue without a clear workspace setup.
- Read any existing content in `FINDINGS.md` before wiki/source discovery. Follow `Research and Context Optimization` guidelines below.

## All Agents Responsibilities

- Identify and run a safe, reasonably scoped baseline verification. Follow the `Baseline Verification At Start` section below.
- Ask proportional clarifying questions only for decisions that remain unresolved after the context pass. Follow the `Proportional Clarifying Questions` section below.
- Update `FINDINGS.md` with reusable context, links, user clarifications, risks, validation clues, and discoveries that future agents should not have to rediscover.
- Fill in the useful parts of `PLAN.md`. Update the plan status so another agent can tell.
- As work progresses, append decisions, blockers, validation results, review notes, and handoff notes. Keep detailed reusable context in `FINDINGS.md`; keep `PLAN.md` focused on current status and next actions.

## Research and Context Optimization

- Start from `PLAN.md` and then `FINDINGS.md` before scanning source code.
- Use `FINDINGS.md` as the requirement-specific context cache and first filter for wiki/source lookup.
- Translate non-technical or vibe-style requests before broad source search.
- Read `wiki/index.md` and relevant wiki pages when they exist.
- Consult architecture docs and `ai/workflows/architecture.md` for architecture-sensitive work.
- Read documented architecture, testing, CI, and command references before broad code search.
- Search source code only for the part of the requirement being worked on, or similar code areas identified.
- Update `FINDINGS.md` with discoveries that future agents would otherwise need to rediscover.

## Baseline Verification At Start

Before source edits for `standard`, `large`, or `risky` implementation work:

1. Look for an existing validation command in `AGENTS.md`, `README`, contribution docs, `wiki/`, CI files, package scripts, build files, or task runners.
2. Choose the smallest meaningful baseline that proves the current workspace starts from a known state.
3. Use `ai/workflows/command-execution.md` to keep outputs concise.
4. Record the command and result in `PLAN.md`.
5. If the baseline fails before any source edits, document it as pre-existing in `PLAN.md` and add useful details to `FINDINGS.md`.
6. If no baseline can be run locally, record why and what CI or manual check would provide equivalent confidence.

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
