# SWE-agent Adoption Assessment

Source: [SWE-agent](https://github.com/SWE-agent/SWE-agent)

Estimated adoption: **about 40%**

## Core Idea

SWE-agent is a software-engineering agent system that takes a GitHub issue, navigates the repository, edits code, runs checks, and submits a patch. Its central contribution is the Agent-Computer Interface: a constrained set of search, file-viewing, editing, and feedback mechanisms designed for language models rather than humans.

## Community Feedback Categories

- **Praised: agent-computer interface design.** SWE-agent argues that the interface between an agent and the computer matters as much as the model, with custom search/view/edit tools outperforming raw shell access. Sources: [SWE-agent ACI docs](https://github.com/SWE-agent/SWE-agent/blob/main/docs/background/aci.md), [AgentWiki summary](https://agentwiki.org/swe_agent).
- **Praised: real issue-to-patch loop.** The project focuses on resolving real GitHub issues by navigating code, making edits, and running tests rather than solving toy coding tasks. Sources: [SWE-agent README](https://github.com/SWE-agent/SWE-agent), [SWE-bench organization README](https://github.com/swe-bench).
- **Praised: structured observations.** Documentation highlights line-numbered file viewing, paginated context, concise search output, and explicit success messages for empty command output. Sources: [SWE-agent ACI docs](https://github.com/SWE-agent/SWE-agent/blob/main/docs/background/aci.md), [AgentWiki summary](https://agentwiki.org/swe_agent).
- **Praised: validation and trajectory inspection.** SWE-agent exposes CLI commands for single runs, batch runs, replaying trajectories, inspectors, and quick stats, making agent behavior easier to debug and evaluate. Source: [SWE-agent CLI docs](https://swe-agent.com/latest/usage/cli/).
- **Praised: benchmark-driven research.** SWE-agent is closely tied to SWE-bench and public evaluation of agents on real-world repository issues. Sources: [SWE-agent README](https://github.com/SWE-agent/SWE-agent), [SWE-bench organization README](https://github.com/swe-bench).
- **Criticized: original project has moved toward maintenance mode.** Current docs say SWE-agent has been superseded by mini-SWE-agent, which is simpler and more flexible while retaining strong benchmark performance. Source: [SWE-agent CLI docs](https://swe-agent.com/latest/usage/cli/).
- **Criticized: setup and environment complexity.** Running issue-to-patch agents and evaluations requires repository snapshots, model configuration, execution environments, and trajectory/debug tooling. Sources: [SWE-agent usage docs](https://swe-agent.com/0.7/usage/), [SWE-agent CLI docs](https://swe-agent.com/latest/usage/cli/).
- **Criticized: narrow interface can be domain-specific.** The custom ACI is powerful for repository issue resolution, but less directly applicable to broader planning, documentation, or multi-agent coordination work. Sources: [SWE-agent ACI docs](https://github.com/SWE-agent/SWE-agent/blob/main/docs/background/aci.md), [AgentWiki summary](https://agentwiki.org/swe_agent).

## Adoption In This Project

`man-agent-ment` adopts the broad software-engineering loop: inspect context, localize the relevant area, make scoped changes, run validation, and review the diff before completion. `workflow-dispatch`, `requirement-planning`, `command-execution`, `testing-quality`, `ci-validation`, and `code-review` together give agents a reproduce/localize/patch/validate habit for ordinary repository work.

The pack does not adopt SWE-agent's main technical contribution: a purpose-built agent-computer interface with custom search/view/edit commands, paginated file viewers, line-addressed edit tools, trajectory replay, inspectors, issue-to-patch benchmark harnesses, or sandboxed batch evaluation infrastructure. It remains a portable instruction layer that can improve behavior across agents, not an autonomous issue-solving runtime.
