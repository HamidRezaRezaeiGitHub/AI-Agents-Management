---
title: Tech Stack
domain: architecture
tags: [architecture, tech-stack]
status: current
last_updated: 2026-05-04
---

# Tech Stack

Technologies that shape implementation choices in this repository.

## Runtime And Language

- Markdown is the primary authored format for workflows, prompts, templates, wiki pages, and native instruction files.
- POSIX `sh` is used for install, audit, requirement, and wiki helper scripts.
- Git is required for requirement branch/workspace behavior and source-control inspection.
- There is no package manager or application build system in this repo.

## Frameworks

No application framework is used. The pack is file-based: instructions, scripts, templates, wiki pages, and native adapter files.

## Dependencies With Architectural Impact

- Standard shell utilities such as `sed`, `awk`, `find`, `grep`, `sort`, `wc`, `chmod`, `mkdir`, and `cp`.
- Git commands such as `git status`, `git diff`, `git branch`, `git switch`, `git show-ref`, and `git ls-files`.
- Native agent discovery conventions for `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, GitHub Copilot instruction files, and Claude command files.

## Version Constraints

- Scripts should remain compatible with `/bin/sh`, not require Bash-only features.
- Commands should work on macOS and Linux; avoid GNU-only flags unless guarded or documented.
- `ai/pack.yaml` records the installed pack version. The current self-installed version is `0.4.8`.
