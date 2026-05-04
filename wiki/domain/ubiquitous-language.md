---
title: Ubiquitous Language
domain: domain
tags: [domain, glossary, terminology]
status: current
last_updated: 2026-05-04
---

# Ubiquitous Language

Canonical domain vocabulary for this project. Use this page to keep stakeholder language, wiki pages, requirements, tests, and code names aligned.

## Terms

| Term | Definition | Aliases To Avoid |
| --- | --- | --- |
| Pack | The installable set of agent instructions, workflows, scripts, templates, wiki starter pages, and native adapters. | template bundle |
| Source pack | Canonical pack files under `packs/default/`. | installed pack |
| Installed pack | Files copied into a target project, usually under `ai/`, `wiki/`, `.github/`, `.claude/`, and root native instruction files. | source pack |
| Target project | A software repository where the pack is installed or audited. | downstream repo |
| Native adapter | Tool-specific entry file such as `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, GitHub Copilot instructions, or Claude commands. | integration file |
| Workflow | A Markdown instruction file under `ai/workflows/` that routes or guides recurring agent behavior. | SOP, process doc |
| Requirement workspace | `requirements/<slug>/` containing `PLAN.md` and `FINDINGS.md` for one task. | task folder |
| `PLAN.md` | Current requirement status, scope, plan, validation, decisions, review, and handoff notes. | spec, ticket |
| `FINDINGS.md` | Requirement-specific context cache for reusable discoveries and investigation notes. | scratchpad |
| Project wiki | Durable knowledge under `wiki/` that agents should read before broad source discovery. | docs dump |
| Manual migration item | An existing target file skipped by the installer that must be reviewed for useful pack updates. | conflict |

## Relationships

- A source pack is installed into a target project as an installed pack.
- A native adapter should point to shared guidance instead of duplicating long rules.
- A requirement workspace holds task-specific knowledge; durable knowledge should be promoted to the project wiki.
- Manual migration items arise because the installer protects existing files.

## Flagged Ambiguities

- Use "source pack" for `packs/default/` and "installed pack" for target-project copies.
- Use "workflow" for agent instruction files under `ai/workflows/`; use "script" for executable shell helpers.
- Use "requirement workspace" for `requirements/<slug>/`, not "project workspace", to avoid confusion with the whole repository.

## Example Dialogue

> **Developer:** Did you update the source pack or only the installed pack copy?
>
> **Domain expert:** I updated the source pack under `packs/default/` and then refreshed the installed pack copy with `scripts/install-adapter.sh .`.
