# AI Agents Management

Central source for shared AI coding-agent instructions, skills, hooks, commands, and adoption templates.

This repo is designed around one rule: keep the high-signal behavior in a shared contract, then expose it through each agent's native autodiscovery file.

## Recommended Model

- `AGENTS.md` is the primary cross-agent entry point.
- `CLAUDE.md`, `GEMINI.md`, and `.github/copilot-instructions.md` mirror the essential contract for tools that load those files natively.
- Detailed reusable material lives under `ai/` so it can be copied, referenced, or adapted per project.
- Project-specific instructions should stay short, concrete, and verified against actual commands in that project.

## Layout

- `AGENTS.md` - cross-agent instructions for this repo and the default template for adopted repos.
- `CLAUDE.md` - Claude Code project memory.
- `GEMINI.md` - Gemini CLI context file.
- `.github/copilot-instructions.md` - GitHub Copilot repository instructions.
- `.github/instructions/*.instructions.md` - Copilot path-specific instructions.
- `ai/shared/agent-operating-contract.md` - canonical behavior shared across agents.
- `ai/docs/agent-discovery-matrix.md` - what each tool autodiscovers and how precedence works.
- `ai/docs/adoption-playbook.md` - process for rolling this system into another repo.
- `ai/docs/sync-strategy.md` - how to keep central and project-local guidance aligned.
- `ai/manifest.yaml` - lightweight metadata for this instruction pack.
- `ai/templates/project/` - files to copy into a target project.
- `ai/skills/`, `ai/hooks/`, `ai/commands/`, `ai/agents/` - staging areas for portable assets.
- `scripts/install-adapter.sh` - copies the starter adapter files into another project.

## Adopt In Another Repo

From this repo:

```sh
scripts/install-adapter.sh /path/to/target-project
```

Then customize the copied files in the target project so commands, architecture notes, and validation steps are true for that repo.

## Working Principle

Determinism comes from:

- native autodiscovery files in every repo,
- short imperative rules instead of vague preferences,
- explicit build/test commands with known failure modes,
- scoped nested instruction files only where a subtree truly differs,
- hooks and CI for enforceable checks,
- periodic instruction review when tooling or project architecture changes.
