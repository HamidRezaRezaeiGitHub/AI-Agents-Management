# Superpowers Adoption Assessment

Source: [Superpowers by Jesse Vincent](https://github.com/obra/superpowers)

Estimated adoption: **about 55%**

## Core Idea

Superpowers is a complete software-development methodology for coding agents, packaged as composable skills plus bootstrap instructions that force agents to use the right process at the right time. Its default path is brainstorm, approve a design, create an isolated branch or worktree, write a detailed implementation plan, implement through TDD and subagents, review each step, verify completion, and then decide how to merge or hand off the branch.

## Community Feedback Categories

- **Praised: methodology as code.** Superpowers is framed as a full workflow, not a loose prompt collection: brainstorming, planning, TDD, review, debugging, and completion are encoded as reusable agent skills. Sources: [Superpowers README](https://github.com/obra/superpowers), [Ry Walker research summary](https://rywalker.com/research/superpowers-skills-framework).
- **Praised: mandatory process before action.** The system tells agents to check and invoke relevant skills before responses or actions, which is meant to prevent agents from improvising around known workflows. Sources: [using-superpowers skill](https://raw.githubusercontent.com/obra/superpowers/main/skills/using-superpowers/SKILL.md), [SkillsHub listing](https://skillshub.wtf/obra/superpowers).
- **Praised: spec and plan gates.** The brainstorming and writing-plans skills make agents refine intent, get design approval, then produce bite-sized implementation tasks before code changes. Sources: [brainstorming skill](https://raw.githubusercontent.com/obra/superpowers/main/skills/brainstorming/SKILL.md), [writing-plans skill](https://github.com/obra/superpowers/blob/main/skills/writing-plans/SKILL.md).
- **Praised: strong verification discipline.** Superpowers emphasizes red-green-refactor TDD, evidence over claims, and verification before declaring work complete. Sources: [Superpowers README](https://github.com/obra/superpowers), [test-driven-development skill](https://raw.githubusercontent.com/obra/superpowers/main/skills/test-driven-development/SKILL.md).
- **Praised: subagent and review loops.** The release writeup and README describe subagent-driven implementation with review between tasks, aiming to let agents work longer without drifting from the approved plan. Sources: [release announcement](https://blog.fsck.com/2025/10/09/superpowers/), [Superpowers README](https://github.com/obra/superpowers).
- **Criticized: self-enforcement can still fail.** A GitHub issue reports agents skipping the TDD skill and writing implementation first even when project instructions require TDD, then proposes hook-based enforcement. Source: [GitHub issue #384](https://github.com/obra/superpowers/issues/384).
- **Criticized: process can be heavy for small work.** The brainstorming skill explicitly rejects skipping design even for simple projects, which makes the system intentionally disciplined but potentially costly for tiny changes. Source: [brainstorming skill](https://raw.githubusercontent.com/obra/superpowers/main/skills/brainstorming/SKILL.md).
- **Criticized: platform complexity.** Installation and behavior differ across Claude Code, Cursor, Codex, OpenCode, Copilot CLI, and Gemini CLI, which makes portability valuable but operationally more complex. Source: [Superpowers README](https://github.com/obra/superpowers).

## Adoption In This Project

`man-agent-ment` adopts the broad workflow-discipline layer of Superpowers. `workflow-dispatch` routes work by complexity, `requirement-planning` creates an ignored local workspace and feature branch, `PLAN.md` records scope and validation, `testing-quality` pushes behavior-focused tests, `ci-validation` requires final evidence, and `code-review` uses a two-pass review that mirrors Superpowers' split between requirement fit and implementation quality.

The pack deliberately stops short of Superpowers' strictness. It does not install auto-triggered runtime skills, require a skill check before every response, create git worktrees by default, enforce red-green-refactor for all code changes, dispatch subagents as a standard implementation mechanism, or use hook-level guards to block non-TDD edits. Its routing model is lighter: quick work stays quick, while larger or riskier work gets more of the planning, validation, and review discipline.
