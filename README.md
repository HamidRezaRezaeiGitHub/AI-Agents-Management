# man-agent-ment

`man-agent-ment` is a portable AI-agent operating pack for software projects.

It gives Codex, Claude Code, GitHub Copilot, Gemini, and similar coding agents a shared way to start requirements, preserve context, consult a project wiki, run validation, review changes, and hand work off between sessions without re-discovering the same information over and over.

The guiding rule is simple: keep durable behavior in reusable workflows, then expose only short pointers through each agent's native instruction files.

## What You Get

- A lightweight dispatcher that classifies work as `quick`, `standard`, `large`, or `risky` so small edits do not become process-heavy.
- Local requirement workspaces under ignored `requirements/<slug>/` folders, with `PLAN.md` for status and `FINDINGS.md` for reusable requirement-specific context.
- A project wiki pattern that lets agents start from stable documentation before scanning source code.
- Vibe-coding translation so stakeholder language becomes concrete acceptance criteria before implementation.
- Ubiquitous-language guidance so domain terms stay consistent across prompts, wiki pages, tests, and code discussion.
- Baseline verification before source edits when a safe project command exists.
- CI, testing, command-output, architecture, and two-pass code-review workflows.
- Adoption prompts for clean projects, existing projects with current AI instructions, temporary install review, and pack updates.

## Why This Exists

Modern coding agents are powerful, but they often fail in familiar ways:

- they over-read the repo and burn tokens,
- they skip planning or ask too many questions,
- they forget discoveries between sessions,
- they use inconsistent domain language,
- they claim completion without enough validation,
- they review code for style while missing requirement mismatch.

This pack turns those lessons into small, inspectable project files. It aims to be disciplined without becoming ceremonial.

## Adoption

Install the default pack into another project:

```sh
scripts/install-adapter.sh /path/to/target-project
```

The installer copies the starter pack into that target project and ensures `requirements/` is ignored. To see the exact copied paths, read [scripts/install-adapter.sh](./scripts/install-adapter.sh).

For common adoption scenarios, use these prepared prompts:

- [Clean project](./packs/default/ai/prompts/adoption/empty-project.md): source code exists, but no meaningful AI-agent instruction files yet.
- [First-time adoption with existing instructions](./packs/default/ai/prompts/adoption/first-time-existing-instructions.md): the project already has Claude, Copilot, Codex, Gemini, Cursor, wiki, README, or custom agent guidance.
- [Temporary install review](./packs/default/ai/prompts/adoption/temp-install-review.md): install into a temporary folder first so an agent can compare and plan migration safely.
- [Update existing pack](./packs/default/ai/prompts/adoption/update-existing-pack.md): the project already has an older installed `ai/pack.yaml`.

Audit an adopted project from this repo:

```sh
scripts/audit-adoption.sh /path/to/target-project
```

Or from inside the adopted project:

```sh
ai/scripts/audit-adoption.sh
```

The central audit reports customized files as `changed` without failing. Missing files and self-audit failures should be investigated.

## Start A Requirement

After adoption, create a local ignored requirement workspace and branch from the target repo root:

```sh
ai/scripts/start-requirement.sh "Requirement Title"
```

This creates `requirements/<slug>/PLAN.md` and `requirements/<slug>/FINDINGS.md`, ensures `requirements/` is ignored, and creates or switches to a `feature/<slug>` branch.

The plan is scaffolded first. Agents should then read existing findings, consult relevant wiki/docs, inspect only narrowly relevant source code, ask proportional clarifying questions, and fill the useful parts of the plan with real context.

## Wiki Lint

In an adopted project:

```sh
ai/scripts/wiki-lint.sh
```

This checks wiki frontmatter, relative Markdown links, and whether topic pages appear in `wiki/index.md`.

## Idea Lineage

This pack intentionally borrows from widely shared agent-engineering ideas, adapted into a portable project pack:

| Source | Adoption | Details |
| --- | ---: | --- |
| [Andrej Karpathy's LLM wiki idea](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) | ~80% | [Assessment](./ai/docs/idea-lineage/karpathy-llm-wiki.md) |
| [mattpocock/skills](https://github.com/mattpocock/skills) | ~65% | [Assessment](./ai/docs/idea-lineage/mattpocock-skills.md) |
| [Matt Pocock's Grill Me writeup](https://www.aihero.dev/my-grill-me-skill-has-gone-viral) | ~70% | [Assessment](./ai/docs/idea-lineage/matt-pocock-grill-me.md) |
| [Superpowers by Jesse Vincent](https://github.com/obra/superpowers) | ~55% | [Assessment](./ai/docs/idea-lineage/superpowers.md) |
| [Cline Memory Bank](https://docs.cline.bot/prompting/cline-memory-bank) | ~75% | [Assessment](./ai/docs/idea-lineage/cline-memory-bank.md) |
| [Aider](https://github.com/Aider-AI/aider) | ~45% | [Assessment](./ai/docs/idea-lineage/aider.md) |
| [OpenHands](https://github.com/OpenHands/OpenHands) | ~35% | [Assessment](./ai/docs/idea-lineage/openhands.md) |
| [SWE-agent](https://github.com/SWE-agent/SWE-agent) | ~40% | [Assessment](./ai/docs/idea-lineage/swe-agent.md) |
| [MetaGPT](https://github.com/geekan/MetaGPT) and [ChatDev](https://github.com/OpenBMB/ChatDev) | Pending | Pending review |
| [GitHub Agentic Workflows](https://github.github.com/gh-aw/) | Pending | Pending review |
| [Domain-Driven Design by Eric Evans](https://www.domainlanguage.com/ddd/) | Pending | Pending review |

The result is not a clone of any one system. It is a practical synthesis: enough process to keep agents aligned, but with routing rules that keep quick work quick.
