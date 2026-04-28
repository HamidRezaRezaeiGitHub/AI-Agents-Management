# AI Agents Management

Central source for shared AI coding-agent instructions, skills, hooks, commands, and adoption templates.

This repo is designed around one rule: keep high-signal behavior in reusable workflows, then expose it through each agent's native autodiscovery file.

## Recommended Model

- In this repo, `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, and `.github/copilot-instructions.md` describe how to work on the pack itself.
- In adopting projects, `AGENTS.md` is the primary cross-agent entry point.
- `CLAUDE.md`, `GEMINI.md`, and `.github/copilot-instructions.md` mirror essential behavior for tools that load those files natively.
- Installable reusable material lives under `packs/default/` and is copied into target project paths.
- Project-specific instructions should stay short, concrete, and verified against actual commands in that project.

## Layout

- `AGENTS.md` - cross-agent instructions for working on this repo.
- `CLAUDE.md` - Claude Code project memory for this repo.
- `GEMINI.md` - Gemini CLI context file for this repo.
- `.github/copilot-instructions.md` - GitHub Copilot repository instructions for this repo.
- `.github/instructions/*.instructions.md` - Copilot path-specific instructions for this repo.
- `ai/shared/agent-operating-contract.md` - canonical behavior shared across agents.
- `ai/docs/agent-discovery-matrix.md` - what each tool autodiscovers and how precedence works.
- `ai/docs/adoption-playbook.md` - process for rolling this system into another repo.
- `ai/docs/sync-strategy.md` - how to keep central and project-local guidance aligned.
- `ai/manifest.yaml` - lightweight metadata for this instruction pack.
- `packs/default/` - installable default pack for adopting projects.
- `packs/default/ai/workflows/workflow-dispatch.md` - lightweight dispatcher that routes quick, standard, large, and risky work without unnecessary token burn.
- `packs/default/ai/workflows/requirement-planning.md` - local requirement planning, branch, and handoff workflow copied into adopting projects.
- `packs/default/ai/templates/requirement/PLAN.md` - template used for local requirement plans.
- `packs/default/ai/prompts/adoption/` - prepared prompts for common adoption and migration scenarios.
- `ai/skills/`, `ai/hooks/`, `ai/commands/`, `ai/agents/` - staging areas for portable assets.
- `scripts/install-adapter.sh` - copies the starter adapter files into another project.
- `scripts/audit-adoption.sh` - compares an adopted project with the current default pack.

## Adopt In Another Repo

### Scenario 1: Clean Project

Use this when the target project has no meaningful AI-agent files yet.

From this repo:

```sh
scripts/install-adapter.sh /path/to/target-project
```

Then customize the copied files in the target project so commands, architecture notes, and validation steps are true for that repo.

Suggested prompt:

```text
Use the prompt in packs/default/ai/prompts/adoption/empty-project.md.
```

### Scenario 2: First-Time Adoption With Existing Instructions

Use this when the target project already has `.github/instructions`, `CLAUDE.md`, `AGENTS.md`, `GEMINI.md`, Cursor rules, custom prompts, wiki files, or other agent guidance.

Recommended flow:

1. Create a temporary folder inside the target project, such as `tmp/agent-pack-install/`.
2. From this central repo, run `scripts/install-adapter.sh /path/to/target-project/tmp/agent-pack-install`.
3. Start an AI session in the target project.
4. Ask the agent to compare the temporary pack with the existing instruction files.
5. Migrate only after the agent has a plan for preserving current behavior.

Suggested prompt:

```text
Use the prompt in packs/default/ai/prompts/adoption/first-time-existing-instructions.md.
```

For a temp-folder review specifically:

```text
Use the prompt in packs/default/ai/prompts/adoption/temp-install-review.md.
```

### Scenario 3: Updating An Existing Pack

Use this when the project already has `ai/pack.yaml` from an older version.

Suggested prompt:

```text
Use the prompt in packs/default/ai/prompts/adoption/update-existing-pack.md.
```

Then audit the target project from this repo:

```sh
scripts/audit-adoption.sh /path/to/target-project
```

Or from inside the adopted project:

```sh
ai/scripts/audit-adoption.sh
```

The central audit reports `changed` for files that differ from the default pack without failing, because adopted projects are expected to customize project-specific files. Missing files and self-audit failures should be investigated.

The installer copies the default pack into these target paths:

- `AGENTS.md`
- `CLAUDE.md`
- `GEMINI.md`
- `.github/copilot-instructions.md`
- `.github/instructions/wiki.instructions.md`
- `.github/instructions/architecture.instructions.md`
- `.github/instructions/ci-validation.instructions.md`
- `.github/instructions/testing-quality.instructions.md`
- `.github/instructions/code-review.instructions.md`
- `.claude/commands/start-requirement.md`
- `ai/README.md`
- `ai/pack.yaml`
- `ai/workflows/workflow-dispatch.md`
- `ai/workflows/requirement-planning.md`
- `ai/workflows/wiki-documentation.md`
- `ai/workflows/architecture.md`
- `ai/workflows/command-execution.md`
- `ai/workflows/ci-validation.md`
- `ai/workflows/testing-quality.md`
- `ai/workflows/code-review.md`
- `ai/workflows/vibe-coding-translation.md`
- `ai/templates/requirement/PLAN.md`
- `ai/templates/requirement/FINDINGS.md`
- `ai/templates/wiki/index.md`
- `ai/templates/wiki/log.md`
- `ai/templates/wiki/page.md`
- `ai/scripts/start-requirement.sh`
- `ai/scripts/audit-adoption.sh`
- `ai/scripts/wiki-lint.sh`
- `ai/hooks/pre-commit-block-requirements.sh`
- `ai/prompts/adoption/*.md`
- `wiki/index.md`
- `wiki/log.md`
- `wiki/architecture/*.md`
- `wiki/guides/testing.md`

## Start A Requirement

After adoption, create a local ignored requirement workspace and branch from the target repo root:

```sh
ai/scripts/start-requirement.sh "Requirement Planning Workflow"
```

In an adopting project, this creates `requirements/<slug>/PLAN.md` and `requirements/<slug>/FINDINGS.md`, ensures `requirements/` is ignored, and creates or switches to a `feature/<slug>` branch.

The plan is scaffolded first. The agent should fill the detailed plan after reading relevant wiki/docs and narrowly required source code, so the plan reflects real project context rather than guesses.

Use `FINDINGS.md` for requirement-specific context, links, user clarifications, source notes, risks, and validation clues that would help future agents avoid repeating discovery work.

## Wiki Lint

In an adopted project:

```sh
ai/scripts/wiki-lint.sh
```

This checks wiki frontmatter, relative Markdown links, and whether topic pages appear in `wiki/index.md`.

## Working Principle

Determinism comes from:

- native autodiscovery files in every repo,
- short imperative rules instead of vague preferences,
- explicit build/test commands with known failure modes,
- scoped nested instruction files only where a subtree truly differs,
- hooks and CI for enforceable checks,
- periodic instruction review when tooling or project architecture changes.
