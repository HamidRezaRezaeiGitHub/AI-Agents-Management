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
- Why this level: TODO.
- Workflows to use: TODO.
- Workflows intentionally skipped for token efficiency: TODO.
- Escalation triggers: TODO: note what would make this task larger or riskier.

## Vibe Coding Translation

- Needed: TODO `yes` or `no`.
- User-facing intent: TODO.
- Concrete behavior: TODO.
- Affected surfaces: TODO.
- Acceptance criteria: TODO.
- Open questions or assumptions: TODO.

## Assumptions

- TODO: List assumptions that should be confirmed or revisited.

## Scope

- TODO: What is included.

## Non-Goals

- TODO: What is intentionally out of scope.

## Context Strategy

- TODO: Start from [FINDINGS.md](./FINDINGS.md), then `wiki/index.md` if present, then only relevant wiki/docs/source files.
- TODO: Record requirement-specific discoveries in [FINDINGS.md](./FINDINGS.md).
- TODO: Note source areas likely relevant to this requirement.
- TODO: Note commands that may have verbose output and should use filtering.

## Architecture Impact

- Needed: TODO `yes` or `no`.
- Existing boundaries or layers affected: TODO.
- Contracts, data flow, or integrations affected: TODO.
- Architecture docs to update: TODO.

## Baseline Verification

- Needed: TODO `yes` or `no`.
- Command or check: TODO.
- Result before source edits: TODO `passed`, `failed`, `not run`, or `not available`.
- If failed before edits: TODO: summarize as pre-existing and link details in [FINDINGS.md](./FINDINGS.md).
- If not run: TODO: explain why and note equivalent CI/manual check.

## Plan

- [ ] Confirm or infer requirement title.
- [ ] Classify complexity with `ai/workflows/workflow-dispatch.md`.
- [ ] Decide whether vibe-coding translation is needed.
- [ ] Translate user-facing intent into concrete acceptance criteria when needed.
- [ ] Create local requirement workspace.
- [ ] Ensure `requirements/` is ignored by git.
- [ ] Create or switch to the expected feature branch.
- [ ] Review existing [FINDINGS.md](./FINDINGS.md) before wiki/docs/source search.
- [ ] Review relevant wiki/docs before broad source search.
- [ ] Check architecture impact and consult `ai/workflows/architecture.md` if needed.
- [ ] Identify and run a baseline verification before source edits, or document why not.
- [ ] Inspect narrowly relevant source code after wiki/docs context.
- [ ] Update [FINDINGS.md](./FINDINGS.md) with reusable context and links.
- [ ] Fill in or revise this plan after context discovery.
- [ ] Implement the requirement.
- [ ] Run targeted tests or quality checks.
- [ ] Perform final self-review with `ai/workflows/code-review.md`.
- [ ] Review CI expectations and run relevant local equivalents.
- [ ] Update wiki documentation if behavior, architecture, testing strategy, or operations changed.
- [ ] Update handoff notes.

## Testing Strategy

- TODO: Describe meaningful tests or checks for this requirement. Avoid trivial framework/language tests.

## CI And Validation Strategy

- TODO: Record baseline verification status before source edits.
- TODO: Identify CI configuration or project docs that define required checks.
- TODO: Record validation commands to run, using concise output where possible.

## Code Review Strategy

- TODO: Note files or risks that need extra self-review or PR-review attention.
- TODO: Record whether review should focus on behavior, architecture, security/privacy, operations, docs, or tests.

## Decisions

- TODO: Record decisions and rationale.

## Validation

- TODO: Record commands run and results.

## Handoff Notes

- TODO: Add what the next agent or future self should know. Keep detailed reusable context in [FINDINGS.md](./FINDINGS.md).
