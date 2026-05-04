# OpenHands Adoption Assessment

Source: [OpenHands](https://github.com/OpenHands/OpenHands)

Estimated adoption: **about 35%**

## Core Idea

OpenHands is an open-source platform for autonomous software-development agents. It provides CLI, local GUI, cloud, enterprise, and SDK surfaces for agents that can inspect repositories, edit files, run commands, browse, call APIs, and work through multi-step development tasks inside controlled runtimes.

## Community Feedback Categories

- **Praised: open autonomous coding platform.** OpenHands is positioned as a community-driven, open-source alternative for AI-driven development rather than a closed coding-agent product. Sources: [OpenHands README](https://github.com/OpenHands/OpenHands), [OpenHands community docs](https://docs.openhands.dev/overview/community).
- **Praised: multiple operating surfaces.** The project offers an SDK, CLI, local GUI, cloud product, and enterprise deployment, making the same agentic stack available in several workflows. Sources: [OpenHands README](https://github.com/OpenHands/OpenHands), [OpenHands product page](https://openhands.dev/product).
- **Praised: sandboxed and controllable runtimes.** The product materials emphasize Docker or Kubernetes isolation, self-hosting, access control, auditability, and full infrastructure control. Sources: [OpenHands homepage](https://openhands.dev/), [OpenHands Enterprise docs](https://docs.openhands.dev/enterprise).
- **Praised: model-agnostic agent infrastructure.** OpenHands is presented as configurable across model providers, CI/CD systems, codebases, and local or cloud deployments. Sources: [OpenHands homepage](https://openhands.dev/), [Hermes Agent issue #477](https://github.com/NousResearch/hermes-agent/issues/477).
- **Praised: real development actions.** Summaries highlight that OpenHands agents can modify code, execute terminal commands, browse the web, and call APIs while iterating on development tasks. Sources: [OpenHands README](https://github.com/OpenHands/OpenHands), [AI Bars overview](https://www.aibars.net/en/library/open-source-ai/details/726373902086967296).
- **Criticized: agent platforms expand the security surface.** Broader reporting on agentic tools warns that agents with file, command, and data access require sandboxing, monitoring, and governance because they act with user-like permissions. Source: [TechRadar analysis](https://www.techradar.com/pro/shadow-ai-and-agents-like-openclaw-are-hijacking-corporate-data-too-easily).
- **Criticized: operational complexity.** Running an autonomous agent platform requires model configuration, sandbox/runtime setup, integrations, and enterprise controls when used in production settings. Sources: [OpenHands Enterprise docs](https://docs.openhands.dev/enterprise), [OpenHands product page](https://openhands.dev/product).
- **Criticized: autonomy still needs review.** Product messaging highlights agents that generate PRs, fix tests, and work through issues, but those outputs still need team review and governance before being trusted. Sources: [OpenHands homepage](https://openhands.dev/), [OpenHands Enterprise docs](https://docs.openhands.dev/enterprise).

## Adoption In This Project

`man-agent-ment` adopts the safety and workflow-governance side of OpenHands more than the platform side. The shared agent contract tells agents to avoid destructive commands, protect secrets, treat generated code as untrusted until reviewed, and validate changes. The default pack adds routing, requirement planning, command-output discipline, CI validation, testing guidance, architecture review, and two-pass code review so autonomous or semi-autonomous agents have a safer operating envelope inside a repository.

The pack does not adopt OpenHands' core platform capabilities: no SDK, hosted or local agent runtime, browser/API action loop, Docker or Kubernetes sandbox orchestration, issue-to-PR automation, RBAC, audit logs, Slack/Jira/Linear integrations, multi-agent scaling, or model-provider management. It is a portable instruction and workflow layer that can guide tools like OpenHands, Codex, Claude, Copilot, or Gemini, not a replacement for an autonomous coding-agent environment.
