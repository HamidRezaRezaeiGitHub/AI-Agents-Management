# Matt Pocock's Grill Me Writeup Adoption Assessment

Source: [My 'Grill Me' Skill Went Viral](https://www.aihero.dev/my-grill-me-skill-has-gone-viral)

Estimated adoption: **about 70%**

## Core Idea

The `grill-me` idea is that an AI assistant should interview the user before implementation when a plan or design is still under-specified. It asks one question at a time, walks the decision tree until shared understanding is reached, explores the codebase instead of asking when the answer is discoverable, and includes a recommended answer so the user can accept good defaults quickly.

## Community Feedback Categories

- **Praised: tiny prompt, high leverage.** The public writeup emphasizes that a few lines can create a materially better planning conversation, and skill registries describe it as a focused design-review and pre-implementation planning tool. Sources: [AI Hero writeup](https://www.aihero.dev/my-grill-me-skill-has-gone-viral), [skills.sh listing](https://skills.sh/mattpocock/skills/grill-me).
- **Praised: alignment before coding.** The skill is positioned around reaching shared understanding before work starts, especially for early requirements discovery. Sources: [AI Hero writeup](https://www.aihero.dev/my-grill-me-skill-has-gone-viral), [GitHub SKILL.md](https://github.com/mattpocock/skills/blob/main/grill-me/SKILL.md).
- **Praised: recommended answers reduce friction.** Pocock notes that adding recommended answers lets users accept obvious defaults quickly instead of explaining every detail from scratch. Source: [AI Hero writeup](https://www.aihero.dev/my-grill-me-skill-has-gone-viral).
- **Praised: codebase lookup before questioning.** The source skill tells agents to inspect the codebase when a question can be answered locally, reducing avoidable back-and-forth. Sources: [GitHub SKILL.md](https://github.com/mattpocock/skills/blob/main/grill-me/SKILL.md), [skills.sh listing](https://skills.sh/mattpocock/skills/grill-me).
- **Praised: useful beyond coding.** The writeup describes non-coding use cases and frames the skill as a general-purpose way to think through vague ideas. Source: [AI Hero writeup](https://www.aihero.dev/my-grill-me-skill-has-gone-viral).
- **Criticized: interaction format matters.** GitHub feedback asks for numbered questions and numbered options so users can answer quickly and refer back to earlier questions. Source: [GitHub issue #45](https://github.com/mattpocock/skills/issues/45).
- **Criticized: depth has a time cost.** The writeup says grilling sessions often last about 45 minutes, which is useful for ambiguous work but too heavy for quick changes. Source: [AI Hero writeup](https://www.aihero.dev/my-grill-me-skill-has-gone-viral).

## Adoption In This Project

`man-agent-ment` adopts the core alignment-before-implementation pattern through `requirement-planning` and `vibe-coding-translation`. For non-trivial work, agents are told to read existing context first, inspect relevant wiki/docs/source areas, ask only unresolved decision-shaping questions, include recommended defaults, and record assumptions in `PLAN.md`. The workflow also explicitly tells agents to answer anything that can be discovered from local context before asking the user.

The pack intentionally softens the original skill's relentless interview style. Instead of grilling every task until every branch is resolved, `workflow-dispatch` keeps quick work lightweight and `requirement-planning` scales questions by risk: none for quick work unless blocked, a few for standard work, and more for large or risky work. That makes the pack less exhaustive than `grill-me`, but better aligned with its goal of staying disciplined without becoming ceremonial.
