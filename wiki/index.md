---
title: Wiki Index
domain: root
tags: [index, navigation]
status: current
last_updated: 2026-05-04
---

# Project Wiki Index

Persistent knowledge base for this project. Start here before broad source-code search.

## Overview

`man-agent-ment` is a portable AI-agent instruction pack. It maintains canonical source files under `packs/default/`, shared design material under `ai/shared/` and `ai/docs/`, and a self-installed copy under `ai/`, `wiki/`, `.github/instructions/`, and `.claude/commands/` for local trial runs.

For pack edits, treat `packs/default/` as the source of truth. Refresh the self-installed copy intentionally with `scripts/install-adapter.sh .`.

## Architecture

- [System Overview](./architecture/system-overview.md) - Current system shape, major components, flow, boundaries, and constraints.
- [Tech Stack](./architecture/tech-stack.md) - Runtime, frameworks, dependencies, and version constraints.
- [Data Flow](./architecture/data-flow.md) - Important data paths, ownership, validation, and error boundaries.
- [Integration Points](./architecture/integration-points.md) - External services, internal boundaries, and failure modes.
- [Architecture Decisions](./architecture/decisions.md) - Current architecture decisions and their consequences.

## Domain

- [Ubiquitous Language](./domain/ubiquitous-language.md) - Canonical domain terms, aliases to avoid, relationships, and ambiguities.

## Operations

- Use `scripts/install-adapter.sh /path/to/target-project` to install the default pack into another repository.
- Use `scripts/audit-adoption.sh /path/to/target-project` from this repo, or `ai/scripts/audit-adoption.sh` inside an installed target, to check pack adoption.
- Use adoption prompts under `packs/default/ai/prompts/adoption/` when planning first-time installs or updates.

## Guides

- [Testing Strategy](./guides/testing.md) - Test layers, commands, utilities, and quality expectations.
