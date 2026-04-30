# Requirement Plan: {{TITLE}}

## Metadata

- Slug: `{{SLUG}}`
- Expected branch: `{{BRANCH}}`
- Created: `{{CREATED_AT}}`
- Status: planning
- Findings: [FINDINGS.md](./FINDINGS.md)

## Prompt Summary

TODO: Summarize the user's requirement in a few sentences.

## Complexity And Routing

- Level: TODO `quick`, `standard`, `large`, or `risky`.
- Reason and workflows: TODO.
- Skipped for token efficiency or escalation triggers: TODO.

## Vibe Coding Translation

- Needed: TODO `yes` or `no`.
- Translation, acceptance criteria, and open questions: TODO.

## Assumptions

- TODO: List assumptions that should be confirmed or revisited.

## Clarifying Questions

- TODO: Questions asked, recommended defaults, user choices, and assumptions accepted without blocking.

## Scope

- TODO: What is included.

## Non-Goals

- TODO: What is intentionally out of scope.

## Context Strategy

- TODO: Start from [FINDINGS.md](./FINDINGS.md), then `wiki/index.md` if present, then only relevant wiki/docs/source files.
- TODO: Record requirement-specific discoveries in [FINDINGS.md](./FINDINGS.md).
- TODO: Note relevant source areas and commands that may need concise output filtering.

## Architecture Impact

- Needed: TODO `yes` or `no`.
- Boundaries, contracts, data flow, integrations, or docs affected: TODO.

## Baseline Verification

- Needed: TODO `yes` or `no`.
- Command or check: TODO.
- Result before source edits: TODO `passed`, `failed`, `not run`, or `not available`.
- Notes: TODO: summarize pre-existing failures, skipped baseline rationale, or equivalent CI/manual check.

## Plan

- [ ] Confirm or infer requirement title.
- [ ] Classify complexity with `ai/workflows/workflow-dispatch.md`.
- [ ] Decide whether vibe-coding translation is needed.
- [ ] Translate user-facing intent into concrete acceptance criteria when needed.
- [ ] Create or resume workspace, ensure `requirements/` is ignored, and use the expected feature branch.
- [ ] Review existing [FINDINGS.md](./FINDINGS.md) before wiki/docs/source search.
- [ ] Review relevant wiki/docs before narrow source search.
- [ ] Ask proportional clarifying questions only for decisions still unresolved after context review.
- [ ] Check architecture impact and consult `ai/workflows/architecture.md` if needed.
- [ ] Identify and run a baseline verification before source edits, or document why not.
- [ ] Inspect narrowly relevant source, update [FINDINGS.md](./FINDINGS.md), then revise this plan.
- [ ] Implement the requirement.
- [ ] Run targeted tests or quality checks and review CI expectations.
- [ ] Perform two-pass self-review with `ai/workflows/code-review.md`.
- [ ] Update wiki documentation and handoff notes when needed.

## Testing Strategy

- TODO: Describe meaningful tests or checks for this requirement. Avoid trivial framework/language tests.

## CI And Validation Strategy

- TODO: Record baseline verification status before source edits.
- TODO: Identify CI configuration or project docs that define required checks.
- TODO: Record validation commands to run, using concise output where possible.

## Code Review Strategy

- TODO: Note files, risks, and review focus.
- Pass 1 requirement fit: TODO `pending`, `passed`, `issues found`, or `not applicable`.
- Pass 2 implementation quality and risk: TODO `pending`, `passed`, `issues found`, or `not applicable`.
- Follow-up: TODO.

## Decisions

- TODO: Record decisions and rationale.

## Validation

- TODO: Record commands run and results.

## Handoff Notes

- TODO: Add what the next agent or future self should know. Keep detailed reusable context in [FINDINGS.md](./FINDINGS.md).
