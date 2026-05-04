---
title: Integration Points
domain: architecture
tags: [architecture, integrations]
status: current
last_updated: 2026-05-04
---

# Integration Points

External systems and internal boundaries for the pack.

## External Services

The pack has no runtime external service dependency. Adoption prompts reference the GitHub repository URL for cloning the source pack, but normal local validation is file and Git based.

## Internal Boundaries

- `scripts/install-adapter.sh` copies from `packs/default/` into a target project without overwriting existing files.
- `scripts/audit-adoption.sh` audits a target project from the source repo and reports customized files as changed.
- `packs/default/ai/scripts/audit-adoption.sh` audits from inside an installed target project.
- Native adapter files point agents back to shared project instructions instead of duplicating long rules.
- `.github/instructions/*.instructions.md` provide GitHub Copilot path/topic-specific guidance after install.
- `.claude/commands/start-requirement.md` exposes requirement setup as a Claude command.

## Failure Modes

- Existing target files are skipped, not overwritten. The installer output marks them as manual migration items.
- Requirement branch switching refuses tracked dirty state and warns about untracked files that may be carried across branches.
- Starter wiki and template placeholders are expected immediately after install; adoption audit reports them as warnings.
- Source and installed copies can drift. Use `diff`, `scripts/audit-adoption.sh .`, and intentional self-install refreshes to detect or correct drift.
