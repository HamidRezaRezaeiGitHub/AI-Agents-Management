# Code Review Workflow

Use this workflow when reviewing a pull request, reviewing another agent's changes, or performing a final self-review before marking source work complete.

## Goal

Find meaningful defects and risks before the change is handed off, committed, merged, or released. Review behavior, architecture, tests, CI, security, documentation, and maintainability before style.

This workflow follows the same SOP-based idea used elsewhere in this pack: make intermediate review assumptions explicit so specialized or sequential agents can coordinate without losing context.

## When To Run

Run code review:

- after implementation and QA/test work are complete,
- before finalizing the source-code portion of a requirement,
- before committing or opening a PR,
- when asked to review a PR or diff,
- after responding to review feedback, to verify the fix.

For tiny documentation-only changes, use a lighter pass focused on correctness and links.

## Inputs

Start from:

- `requirements/<slug>/PLAN.md` when available,
- PR description, issue, or user request,
- changed-file list and diff,
- relevant wiki pages,
- architecture, testing, and CI workflows,
- validation results already recorded.

If the review is large, review in focused chunks. Prefer reviewing smaller diffs over trying to absorb a huge change at once.

## Author Self-Review

Before asking someone else to review or before finalizing:

1. Read the diff yourself.
2. Check that the implementation matches the requirement and acceptance criteria.
3. Remove accidental files, debug code, dead code, and unrelated changes.
4. Add notes for reviewers when file order, risky areas, or non-obvious decisions matter.
5. Verify tests, CI expectations, and wiki updates are recorded in the plan.

## Review Order

Review in this order:

1. Requirement fit: does the change solve the requested problem without scope creep?
2. Architecture: does it respect boundaries, ownership, data flow, and contracts?
3. Behavior: are edge cases, failure modes, permissions, and user impact correct?
4. Tests: do tests catch real bugs and regressions?
5. CI/build: would configured checks pass?
6. Security/privacy: are secrets, auth, data exposure, injection, dependency, and permission risks addressed?
7. Operations: are config, migration, observability, performance, and deployment implications handled?
8. Documentation/wiki: did durable project knowledge change?
9. Maintainability: is the code simple, local, readable, and consistent with existing patterns?

Style and naming matter, but do not let nitpicks crowd out correctness and risk.

## What To Look For

- Missing or incorrect requirement behavior.
- Broken public contracts, APIs, schemas, or data migrations.
- Logic in the wrong layer or module.
- Hidden coupling or duplicated abstractions.
- Edge cases not handled.
- Error paths, empty states, retries, or timeouts missing.
- Authorization, privacy, or data integrity gaps.
- Tests that only prove mocks/frameworks work.
- Tests that were weakened, skipped, or updated without rationale.
- CI, formatting, typecheck, or build failures.
- Dependency or lockfile changes without justification.
- Wiki/docs drift after architecture, behavior, testing, or operations changes.

## Feedback Style

When reviewing for another agent or human:

- Lead with blocking correctness, security, or data-loss issues.
- Be specific: file, line, observed problem, expected behavior, and suggested fix when useful.
- Distinguish blockers from suggestions.
- Avoid repeated nitpicks; summarize repeated patterns once.
- Do not act like a human linter. Prefer issues that affect behavior, risk, maintainability, or clarity.
- If no issues are found, say what was reviewed and mention residual risk or test gaps.

## PR Review Output

For PR review, structure the response as:

1. Findings, ordered by severity.
2. Open questions or assumptions.
3. Validation reviewed or missing.
4. Brief summary only after findings.

For self-review before finalizing, record the review result in `PLAN.md`.

## Validation

Use:

- `ai/workflows/testing-quality.md`,
- `ai/workflows/ci-validation.md`,
- `ai/workflows/architecture.md`,
- `ai/workflows/wiki-documentation.md`,
- `ai/workflows/command-execution.md`.

If validation cannot be run, record why and identify what CI or a human should verify.
