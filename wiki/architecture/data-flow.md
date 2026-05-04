---
title: Data Flow
domain: architecture
tags: [architecture, data-flow]
status: current
last_updated: 2026-05-04
---

# Data Flow

Important information flows through this repository.

## Main Flows

- Pack source flow: edit `packs/default/` files, validate scripts and docs, then install or update target projects from those source files.
- Adoption flow: run installer dry-run, inspect skipped existing files, install missing files, manually migrate skipped files, then audit adoption.
- Requirement flow: route a request, create or resume `requirements/<slug>/PLAN.md` and `FINDINGS.md`, record baseline validation, implement, validate, review, and hand off.
- Wiki flow: agents read `wiki/index.md` first for durable context, capture requirement-specific findings in `FINDINGS.md`, then promote reusable knowledge back into wiki pages.
- Self-install flow: this repo can install its own default pack surface into root `ai/` and `wiki/` for local trials, while `packs/default/` remains canonical.

## Data Ownership

- `ai/manifest.yaml` describes source-pack inventory, purposes, and target paths.
- `packs/default/ai/pack.yaml` records the pack version copied into target projects.
- `requirements/<slug>/PLAN.md` owns current task status, scope, validation, and handoff state.
- `requirements/<slug>/FINDINGS.md` owns detailed requirement-specific context that should not be rediscovered.
- `wiki/` owns durable project knowledge for installed projects and this repo's local trial installation.

## Validation And Error Boundaries

- `scripts/install-adapter.sh` validates target directory existence and refuses unknown options.
- `start-requirement.sh` validates it runs at a Git repo root, derives a non-empty slug, refuses unsafe tracked dirty branch switches, and warns about untracked files before switching.
- `lint-requirements.sh` validates requirement metadata and required files.
- `wiki-lint.sh` validates wiki metadata and links.
- Audit scripts distinguish missing files from intentional project-specific changes.
