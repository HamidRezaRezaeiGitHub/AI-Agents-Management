---
name: workflow-dispatch
use_when: Before acting on a user request, especially at the start of a session or when switching tasks.
reads:
  - AGENTS.md
  - CLAUDE.md
  - GEMINI.md
  - .github/copilot-instructions.md
  - ai/README.md
writes:
  - requirements/<slug>/PLAN.md
  - requirements/<slug>/FINDINGS.md
strictness: required
---

# Workflow Dispatch

Use this workflow before choosing how much process a request needs. The goal is to make agents consistent without spending heavy planning tokens on small tasks.

## First Decision

Classify the request before broad source search:

- `quick`: tiny, low-risk, and reversible. Examples: answer a question, run a simple command, fix a typo, adjust a small comment, update one obvious docs line.
- `standard`: normal feature, bug fix, refactor, investigation, or documentation task that benefits from a local requirement workspace.
- `large`: multi-file, multi-step, cross-area, or ambiguous work that needs a stronger plan and handoff discipline.
- `risky`: work touching security, auth, payments, privacy, data migrations, infra, public APIs, irreversible data changes, or production operations.

When unsure between two levels, choose the higher level only if the extra process will reduce real risk.

## Routing Table

| Situation | Start With | Also Use |
| --- | --- | --- |
| Quick task | Native project instructions and `ai/workflows/command-execution.md` when commands are needed | Record nothing unless the user asks or a durable discovery appears |
| New standard requirement | `ai/workflows/requirement-planning.md` | `requirements/<slug>/FINDINGS.md` before wiki/source search |
| Large requirement | `ai/workflows/requirement-planning.md` | `architecture`, `testing-quality`, `ci-validation`, and `code-review` checkpoints |
| Risky requirement | `ai/workflows/requirement-planning.md` | Architecture, testing, CI, code review, and explicit user confirmation for unsafe operations |
| Vague or non-developer request | `ai/workflows/vibe-coding-translation.md` | Then route the translated requirement by complexity |
| Architecture-sensitive work | `ai/workflows/architecture.md` | Update wiki architecture pages if durable knowledge changes |
| Test work | `ai/workflows/testing-quality.md` | Use project wiki testing guidance first |
| Terminal work | `ai/workflows/command-execution.md` | Filter verbose output with targeted commands |
| Before finishing implementation | `ai/workflows/code-review.md` | Then `ai/workflows/ci-validation.md` |
| Wiki or durable knowledge change | `ai/workflows/wiki-documentation.md` | Promote from `FINDINGS.md` only when knowledge is reusable beyond the requirement |

## Token-Burn Rules

- Do not create a requirement workspace for `quick` tasks unless the user asks.
- Do not read all workflows. Use this dispatcher, then read only the routed workflow files.
- Do not ask broad interview questions for `quick` tasks. For larger tasks, scale clarifying questions with complexity and ask only what cannot be answered from the repo.
- For standard or larger work, read `PLAN.md` and `FINDINGS.md` before wiki or source code.
- For source discovery, search for narrow symbols, paths, or errors before opening whole files.
- Prefer summaries and links in `FINDINGS.md`; avoid copying large wiki, source, or terminal output.
- If the task grows beyond its initial classification, update `PLAN.md` with the new complexity and why.

## Required Plan Record

For `standard`, `large`, or `risky` work, record the chosen complexity in `PLAN.md` with:

- why that level was chosen,
- which workflows apply,
- which workflows are intentionally skipped to save tokens,
- any escalation trigger that would require stronger review.
