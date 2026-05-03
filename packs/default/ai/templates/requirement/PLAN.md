# Requirement Plan: {{TITLE}}

This plan is a working record, not a fixed form. Keep the useful sections, remove irrelevant TODOs, and add sections such as architecture, test design, wiki maintenance, rollout, or risk review when the requirement needs them, as long as project linting still passes.

## Metadata

- Slug: `{{SLUG}}`
- Expected branch: `{{BRANCH}}`
- Created: `{{CREATED_AT}}`
- Last modified: `{{CREATED_AT}}`
- Status: planning
- Findings: [FINDINGS.md](./FINDINGS.md)

Status examples: `planning`, `active`, `blocked`, `parked`, `complete`, `cancelled`.

## Request

TODO: Summarize the user's requirement in a few sentences.

## Routing

- Level: TODO `quick`, `standard`, `large`, or `risky`.
- Workflows: TODO: List only the workflows this task needs.
- Skipped: TODO: Note intentionally skipped workflows or escalation triggers.

## Scope

- Included: TODO.
- Out of scope: TODO.
- Assumptions or open questions: TODO.

## Baseline Verification

- Needed: TODO `yes` or `no`.
- Command or check: TODO.
- Result before source edits: TODO `passed`, `failed`, `not run`, or `not available`.
- Notes: TODO.

## Plan

- [ ] Confirm or infer requirement title.
- [ ] Classify complexity.
- [ ] Decide whether vibe-coding translation is needed.
- [ ] Review existing [FINDINGS.md](./FINDINGS.md) before wiki/docs/source search.
- [ ] When resuming, inspect recent diffs, handoff notes, and the next unfinished checklist item before broad discovery.
- [ ] Check relevant wiki/docs and inspect source narrowly.
- [ ] Run or record baseline verification before source edits when available.
- [ ] Ask only unresolved decision-shaping questions.
- [ ] Update [FINDINGS.md](./FINDINGS.md), then revise this plan. (Plan may contain multiple steps)
- [ ] Implement the requirement. (Replace this lint of the checklist with steps' titles, if applicable.)
- [ ] Run targeted validation and review CI expectations.
- [ ] Perform two-pass self-review with `ai/workflows/code-review.md`.
- [ ] Update wiki and handoff notes when durable knowledge changes.

## Decisions

- TODO: Record decisions and rationale.

## Validation

- TODO: Record commands run and results.

## Handoff Notes

- TODO: Add what the next agent or future self should know. Keep detailed reusable context in [FINDINGS.md](./FINDINGS.md).
