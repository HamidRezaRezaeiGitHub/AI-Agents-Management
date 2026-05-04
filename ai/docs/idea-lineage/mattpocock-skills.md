# mattpocock/skills Adoption Assessment

Source: [mattpocock/skills](https://github.com/mattpocock/skills)

Estimated adoption: **about 65%**

## Core Idea

Matt Pocock's skills collection packages practical agent behavior as small, installable workflow units. The core idea is to move coding agents away from one-off prompting and toward repeatable engineering practices: question the user until alignment is clear, preserve project language, write behavior-focused tests, diagnose with feedback loops, split work into vertical slices, protect git operations, and care about architecture as part of normal development.

## Community Feedback Categories

- **Praised: real engineering workflows.** Community writeups highlight that the collection encodes planning, testing, architecture, issue breakdown, and debugging habits rather than only adding tool access. Sources: [repository README](https://github.com/mattpocock/skills), [AgentConn summary](https://agentconn.com/skills/mattpocock-skills/).
- **Praised: small and composable units.** The skills are useful individually, easy to adapt, and less monolithic than process-heavy agent frameworks. Sources: [repository README](https://github.com/mattpocock/skills), [AgentConn summary](https://agentconn.com/skills/mattpocock-skills/).
- **Praised: alignment before coding.** `grill-me` and `grill-with-docs` are valued because they force ambiguous decisions, domain terms, and constraints into the open before implementation. Sources: [repository README](https://github.com/mattpocock/skills), [Reddit usage discussion](https://www.reddit.com/r/hermesagent/comments/1sz4px1/matt_pococks_skills_repo_hermes_subagents_for/).
- **Praised: feedback loops.** The `tdd` and `diagnose` skills put failing tests, reproducible loops, and observable behavior at the center of agent work. Sources: [repository README](https://github.com/mattpocock/skills), [AgentConn summary](https://agentconn.com/skills/mattpocock-skills/).
- **Criticized: skill chaining is still manual.** GitHub issue feedback asks how planning and issue-splitting skills should hand work to `tdd`, which shows that cross-skill orchestration is not automatic. Source: [GitHub issue #49](https://github.com/mattpocock/skills/issues/49).
- **Criticized: interaction ergonomics matter.** Users have requested numbered questions and more structured responses so long grilling sessions are easier to answer and revisit. Source: [GitHub issue #45](https://github.com/mattpocock/skills/issues/45).
- **Criticized: human review is still required.** Community usage reports still rely on a human to reject poor issue splits, catch drift, and decide when a plan is ready for agents to execute. Source: [Reddit usage discussion](https://www.reddit.com/r/hermesagent/comments/1sz4px1/matt_pococks_skills_repo_hermes_subagents_for/).

## Adoption In This Project

`man-agent-ment` adopts much of the engineering-workflow philosophy, but expresses it as a cross-agent project pack instead of runtime-discoverable `SKILL.md` packages. `workflow-dispatch`, `requirement-planning`, `vibe-coding-translation`, `testing-quality`, `architecture`, `wiki-documentation`, `ci-validation`, and `code-review` give agents small, focused procedures with explicit triggers, inputs, outputs, and validation expectations. The pack also has a portable `ai/skills/` area for future skill packages and starter guidance for keeping skill descriptions precise.

The adoption is intentionally incomplete. The default pack does not currently ship first-class installable skills, issue-tracker automation, a dedicated diagnosis workflow, a strict red-green-refactor TDD loop, or an interactive setup skill that configures labels, docs paths, and team conventions. Its design favors portable workflow files and thin native adapters across Codex, Claude, Copilot, Gemini, and similar tools rather than optimizing for one agent runtime's skill marketplace.
