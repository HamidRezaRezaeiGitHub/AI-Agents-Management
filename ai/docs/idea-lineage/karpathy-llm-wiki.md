# Andrej Karpathy's LLM Wiki Idea Adoption Assessment

Source: [Andrej Karpathy's LLM wiki idea](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)

Estimated adoption: **about 80%**

## Core Idea

Karpathy's LLM wiki pattern replaces repeated query-time retrieval from raw documents with a persistent, interlinked Markdown wiki maintained by an LLM. Raw sources remain the source of truth, the wiki becomes the synthesized working layer, and a schema file such as `AGENTS.md` or `CLAUDE.md` teaches the agent how to ingest, query, lint, and maintain the knowledge base.

## Community Feedback Categories

- **Praised: compounding memory.** Supporters liked that useful synthesis survives beyond one chat session instead of being rebuilt from scratch. Sources: [original gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f), [Denser.ai analysis](https://denser.ai/blog/llm-wiki-karpathy-knowledge-base/).
- **Praised: human-readable agent memory.** Markdown, links, `index.md`, `log.md`, and git history make the knowledge layer inspectable by both humans and agents. Sources: [original gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f), [Denser.ai analysis](https://denser.ai/blog/llm-wiki-karpathy-knowledge-base/).
- **Praised: maintenance fit.** Cross-linking, summary updates, contradiction checks, and bookkeeping are tedious for humans but natural agent work. Sources: [original gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f), [Denser.ai analysis](https://denser.ai/blog/llm-wiki-karpathy-knowledge-base/).
- **Criticized: scale and retrieval limits.** Commenters and follow-on implementations noted that plain Markdown plus an index may need search, graph, or hybrid retrieval once the corpus grows. Sources: [Hacker News discussion](https://news.ycombinator.com/item?id=47640875), [Denser.ai analysis](https://denser.ai/blog/llm-wiki-karpathy-knowledge-base/).
- **Criticized: quality drift.** A self-maintained wiki can compound hallucinations or stale claims unless it keeps citations, review checkpoints, contradiction handling, and linting discipline. Sources: [Hacker News discussion](https://news.ycombinator.com/item?id=47640875), [Denser.ai analysis](https://denser.ai/blog/llm-wiki-karpathy-knowledge-base/).
- **Criticized: novelty and naming.** Some feedback framed the idea as a remix of wikis, Zettelkasten, literate documentation, or RAG rather than a wholly new category. Sources: [Hacker News discussion](https://news.ycombinator.com/item?id=47640875), [DEV/Starmorph guide](https://dev.to/starmorph/how-to-build-karpathys-llm-wiki-the-complete-guide-to-ai-maintained-knowledge-bases-3dk3).

## Adoption In This Project

`man-agent-ment` adopts the project-wiki part of the idea for consumer projects that install the default pack. The copied instructions give each target project a committed `wiki/` with `index.md`, `log.md`, starter architecture/domain/testing pages, a `wiki-documentation` workflow, Copilot wiki instructions, and `wiki-lint.sh`. Agents are told to start from the target project's wiki before broad source scans and to promote durable findings from local requirement workspaces into that wiki.

The installed pack intentionally stops short of Karpathy's full loop: it does not provide automatic ingest commands, Obsidian integration, citation enforcement, typed knowledge graphs, confidence scoring, or autonomous maintenance outside the agent's normal requirement work. The wiki pattern here is a lightweight project memory layer for coding agents working inside target repositories, not a general LLM-authored research vault.
