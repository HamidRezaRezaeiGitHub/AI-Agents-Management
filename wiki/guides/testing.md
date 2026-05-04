---
title: Testing Strategy
domain: guides
tags: [testing, quality, validation]
status: current
last_updated: 2026-05-04
---

# Testing Strategy

Testing and validation approach for this repository.

## Test Types

- Shell syntax validation for all changed `.sh` scripts.
- Adoption audits for source-to-target installation completeness.
- Wiki lint for metadata and link health.
- Requirement lint for local requirement workspace metadata.
- Focused smoke tests in temporary Git repositories when branch or installer behavior changes.
- Manual review of skipped existing files after installer dry runs or self-installs.

## Commands

Verified local commands:

```sh
sh -n scripts/install-adapter.sh
sh -n scripts/audit-adoption.sh
sh -n packs/default/ai/scripts/start-requirement.sh
sh -n packs/default/ai/scripts/requirement-status.sh
sh -n packs/default/ai/scripts/list-requirements.sh
sh -n packs/default/ai/scripts/lint-requirements.sh
sh -n packs/default/ai/scripts/audit-adoption.sh
sh -n packs/default/ai/scripts/wiki-lint.sh
sh -n ai/scripts/start-requirement.sh
sh -n ai/scripts/requirement-status.sh
sh -n ai/scripts/list-requirements.sh
sh -n ai/scripts/lint-requirements.sh
sh -n ai/scripts/audit-adoption.sh
sh -n ai/scripts/wiki-lint.sh
scripts/audit-adoption.sh .
ai/scripts/audit-adoption.sh
ai/scripts/wiki-lint.sh
ai/scripts/lint-requirements.sh requirements
git diff --check
```

Use `scripts/install-adapter.sh --dry-run .` before self-install refreshes. After refresh, run it again and expect `created=0` when the installed surface is complete.

## Utilities And Patterns

- Use `/tmp` or another disposable directory for install and Git smoke tests.
- For branch behavior, create a temporary Git repository, configure local test user identity, commit a minimal file, and exercise `start-requirement.sh`.
- Treat placeholder warnings in freshly installed wiki/template files as expected unless the task is specifically to customize them.
- Treat `changed` native instruction files in `scripts/audit-adoption.sh .` as expected in this source repo when they are intentionally project-specific.

## Quality Bar

Tests should cover meaningful behavior, edge cases, error paths, and regressions. Avoid tests that mainly verify the language, framework, or mocks.
