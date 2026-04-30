# Aider Adoption Assessment

Source: [Aider](https://github.com/Aider-AI/aider)

Estimated adoption: **about 45%**

## Core Idea

Aider is a terminal-based AI pair programmer that edits code in a local git repository. Its key ideas are to keep AI coding inside familiar developer workflows, map the codebase for context, apply multi-file edits directly, use git commits as the audit and undo layer, and run lint/test commands so the assistant can fix failures in the same loop.

## Community Feedback Categories

- **Praised: git-native workflow.** Aider emphasizes automatic commits, readable commit messages, and normal git diff/revert tools for managing AI changes. Sources: [Aider README](https://github.com/Aider-AI/aider), [Aider docs](https://aider.chat/docs/).
- **Praised: terminal-first pair programming.** Users and summaries describe Aider as a CLI collaborator that works alongside any editor instead of being tied to one IDE. Sources: [Aider homepage](https://aider.chat/), [DeployHQ guide](https://www.deployhq.com/guides/aider).
- **Praised: large-codebase context.** The repo map is repeatedly highlighted as a way to help the model reason about larger projects without manually pasting every file. Sources: [Aider README](https://github.com/Aider-AI/aider), [AgentWiki summary](https://agentwiki.org/aider).
- **Praised: test and lint loops.** Aider can run configured checks after edits and ask the model to fix failures, which makes validation part of the edit loop. Sources: [Aider README](https://github.com/Aider-AI/aider), [Aider docs](https://aider.chat/docs/).
- **Praised: practical adoption.** The project advertises high install counts and user testimonials, and third-party guides frame it as a mature open-source terminal workflow for real repositories. Sources: [Aider homepage](https://aider.chat/), [Better Stack guide](https://betterstack.com/community/guides/ai/aider-ai-pair-programming/).
- **Criticized: setup and model dependency.** Third-party guides note that Aider requires API keys or local model configuration and project-specific setup before it becomes useful. Sources: [AI Wiki guide](https://artificial-intelligence-wiki.com/agentic-ai/agent-architectures-and-components/aider-ai-guide/), [Aider docs](https://aider.chat/docs/).
- **Criticized: terminal ergonomics.** Aider's strength is also a constraint: users need comfort with command-line workflows, git, and local environment setup. Sources: [DeployHQ guide](https://www.deployhq.com/guides/aider), [AI tools directory](https://drose.io/aitools/tools/aider).
- **Criticized: not a process methodology by itself.** Aider supplies a strong editing and git loop, but project teams still need their own rules for requirements, architecture, review, and documentation. Sources: [Aider README](https://github.com/Aider-AI/aider), [Aider docs](https://aider.chat/docs/).

## Adoption In This Project

`man-agent-ment` adopts several Aider-adjacent habits without trying to become an editor or patch engine. Requirement work starts on a feature branch, `PLAN.md` records baseline verification before edits, `command-execution` keeps terminal output focused, `ci-validation` requires meaningful final checks, and `code-review` treats diffs as the main review surface. This preserves some of Aider's git-and-validation discipline across multiple agent runtimes.

The pack does not adopt Aider's core product mechanics: automatic code edits through a terminal pair-programming loop, repo maps, automatic commits, model configuration, editor integration, voice input, or an assistant-managed lint/test/fix cycle. Its emphasis is upstream of Aider: deciding how an agent should plan, preserve context, validate, review, and hand off work, regardless of which coding tool applies the actual patch.
