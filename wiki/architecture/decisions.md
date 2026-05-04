---
title: Architecture Decisions
domain: architecture
tags: [architecture, decisions]
status: current
last_updated: 2026-05-04
---

# Architecture Decisions

Meaningful architecture decisions for the pack. Add new entries when future changes alter source-of-truth boundaries, install behavior, validation expectations, or handoff contracts.

## Decisions

### 2026-05-04 | Keep `packs/default/` As Source Of Truth

- Context: This repository now has a self-installed `ai/` and `wiki/` surface for local trials as well as source pack files under `packs/default/`.
- Options considered: edit only installed files, edit only source files, or edit source files and refresh installed files intentionally.
- Decision: Treat `packs/default/` as canonical for pack changes. Update self-installed files only when intentionally refreshing this repo's local installation.
- Consequences: Agents should avoid editing installed copies as the primary source. Validation should compare or audit installed files after refresh.

### 2026-05-04 | Installer Skips Existing Files

- Context: Target projects often already have agent instructions or docs.
- Options considered: overwrite files, prompt interactively, or skip existing files and require manual migration.
- Decision: Skip existing files, log them clearly, and make adoption/update prompts treat them as manual migration items.
- Consequences: Installs are safer, but pack updates require deliberate review for skipped files.

### 2026-05-04 | Requirement Branch Switches Warn On Untracked Files

- Context: Untracked files do not usually block `git switch`, but they can follow an agent across branches and confuse validation or handoff.
- Options considered: ignore them, fail hard, or warn and require an agent decision.
- Decision: Warn, list a sample, and tell agents to decide whether to commit, stash, remove, ignore, or intentionally carry them.
- Consequences: Agents get visibility without blocking legitimate branch switches.
