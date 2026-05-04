---
title: System Overview
domain: architecture
tags: [architecture, overview]
status: current
last_updated: 2026-05-04
---

# System Overview

Current system shape for this repository. Use this page to orient before scanning the pack source.

## Purpose

`man-agent-ment` packages reusable AI coding-agent instructions for software projects. It serves maintainers who want Codex, Claude Code, Gemini, GitHub Copilot, and similar agents to share lightweight routing, planning, validation, review, wiki, and handoff habits.

## Major Components

- `packs/default/`: source-of-truth installable pack files.
- `scripts/`: source-repo adoption and audit scripts.
- `ai/shared/`: canonical shared operating contract.
- `ai/docs/`: research notes, adoption guidance, and idea-lineage assessments.
- `ai/skills/`, `ai/hooks/`, `ai/commands/`, `ai/agents/`: reusable asset design areas.
- `requirements/`: local-only requirement workspaces. The start-requirement script keeps this directory ignored by default; users may intentionally force-add a single requirement folder in git when cross-machine collaboration is needed.
- `ai/`, `wiki/`, `.github/instructions/`, `.claude/commands/`: self-installed default pack surface for local target-project trials.

## Request Or Data Flow

The core flow is source pack to target project:

1. Maintain canonical files under `packs/default/`.
2. Preview installation with `scripts/install-adapter.sh --dry-run <target>`.
3. Install missing files with `scripts/install-adapter.sh <target>`.
4. Preserve existing target files by skipping them and manually migrating useful pack changes.
5. Audit adoption from the source repo or from the installed target project.

## Ownership Boundaries

- Source pack behavior belongs in `packs/default/`.
- Source-repo-only guidance belongs in root instruction files, `ai/shared/`, and `ai/docs/`.
- Target-project installed behavior belongs in `ai/workflows/`, `ai/scripts/`, `ai/templates/`, `wiki/`, and native adapter files after installation.
- Scripts should stay portable POSIX shell unless a file is explicitly platform-specific.

## Constraints

- Keep auto-loaded native instruction files concise.
- Avoid secrets, local machine paths, tokens, and private customer data in committed instructions.
- Preserve portability across macOS, Linux, and Windows unless explicitly scoped otherwise.
- Validate shell changes with `sh -n` and adoption/wiki lint checks.
- Do not let the self-installed copy drift accidentally from `packs/default/`; refresh it intentionally.
