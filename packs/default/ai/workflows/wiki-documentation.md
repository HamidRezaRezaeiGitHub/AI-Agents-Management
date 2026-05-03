---
name: wiki-documentation
use_when: Reading, maintaining, or promoting durable project knowledge into the project wiki.
reads:
  - wiki/index.md
  - wiki/log.md
  - requirements/<slug>/FINDINGS.md
writes:
  - wiki/
strictness: contextual
---

# Wiki Documentation Workflow

Use this workflow to maintain a project-local LLM wiki: a concise, linked Markdown knowledge base that helps humans and AI agents understand the project without repeatedly scanning all source code.

## Core Idea

The wiki is a compiled knowledge layer. Source code, READMEs, ADRs, issues, requirement plans, and requirement findings remain source material. The wiki summarizes stable project knowledge: architecture, domain concepts, conventions, operations, data flows, and important decisions.

Requirement-specific findings belong in `requirements/<slug>/FINDINGS.md` first. Promote them into the wiki only when they become durable project knowledge.

Agents should use the wiki to reduce broad source scans. Start from `wiki/index.md`, read only relevant wiki pages, then inspect source code narrowly when implementation details are needed.

## Directory Structure

Recommended baseline:

```text
wiki/
  index.md
  log.md
  architecture/
  domain/
    ubiquitous-language.md
  operations/
  guides/
```

Projects may add domain-specific folders such as `ui/`, `data-models/`, `providers/`, `api/`, `infra/`, or `security/`.

## Page Types

- `wiki/index.md`: navigation map with one-line summaries for every page.
- `wiki/log.md`: chronological log of wiki updates, ingest, lint, and meaningful project changes.
- Topic pages: focused pages for architecture, domain concepts, workflows, operations, and conventions.
- Ubiquitous language page: canonical domain terms, one-sentence definitions, aliases to avoid, key relationships, and flagged ambiguities.
- Architecture pages: current system overview, tech stack, data flow, integration points, and decisions.

## Frontmatter

Every topic page should include:

```yaml
---
title: Human-readable page title
domain: architecture|domain|operations|guides|other
tags: [short, useful, tags]
status: current|draft|stale
last_updated: YYYY-MM-DD
---
```

`wiki/index.md` and `wiki/log.md` may use lighter frontmatter.

Update `last_updated` whenever page content changes.

## Lookup

At the start of non-trivial work:

1. Read `wiki/index.md` if it exists.
2. Read only the wiki pages relevant to the task.
3. Check `wiki/log.md` when recent context or prior wiki changes matter.
4. Search source code only after wiki lookup has narrowed the area.

If no wiki exists, create the baseline when the task is documentation-related or when the user asks for project orientation/documentation.

## When To Update

Update the wiki after completing a requirement that changes:

- architecture,
- domain model,
- domain vocabulary or stakeholder terminology,
- user-visible behavior,
- API contracts,
- data flows,
- operational/deployment behavior,
- testing or development conventions,
- security or privacy posture.

Skip wiki updates for trivial typo fixes, mechanical formatting, or small internal refactors that do not change documented behavior.

## Update Procedure

1. Update affected topic pages.
2. Update frontmatter dates and status.
3. Add or fix inline cross-links.
4. Update `wiki/index.md` summaries and links.
5. Append an entry to `wiki/log.md`.

For architecture-impacting changes, follow `ai/workflows/architecture.md` and update relevant pages under `wiki/architecture/`.

For domain-language changes, update `wiki/domain/ubiquitous-language.md` when a term becomes durable across requirements. Keep requirement-local vocabulary notes in `requirements/<slug>/FINDINGS.md` until they are stable enough for the wiki.

## Ubiquitous Language

Use the ubiquitous language page to prevent drift between stakeholder wording, requirements, tests, wiki pages, and code names.

When updating it:

- Include only domain terms a domain expert would recognize.
- Skip generic programming terms unless the project uses them as domain language.
- Use one-sentence definitions that say what the term is, not what it does.
- Pick one canonical term when synonyms compete, and list aliases to avoid.
- Flag ambiguous or overloaded terms with a recommendation.
- Capture important relationships between terms, including lifecycle, ownership, or cardinality when useful.
- Group terms by natural subdomain only when it improves scanning.

Do not rename code or rewrite broad docs just to match a new term unless the requirement asks for that migration. Record terminology mismatches first, then plan migration deliberately.

## Log Format

Use one entry per meaningful wiki event:

```markdown
## [YYYY-MM-DD] action | Subject

Brief description of what changed and why.
```

Allowed actions: `create`, `update`, `ingest`, `lint`, `query`.

## Linking

- Use relative Markdown links.
- Link inline where the related concept is discussed.
- Avoid footer-only `See also`, `References`, or `Sources` sections for internal wiki navigation.
- Prefer stable page-level links over fragile heading anchors.

## Style

- Write in present tense.
- Keep pages concise and high-level.
- Explain behavior, relationships, and decisions.
- Avoid source code except for short illustrative snippets when they clarify a concept.
- Target both humans and AI agents.
- Split pages when a reader must scroll past unrelated concepts to find what they need.

## Wiki Lint

When asked to lint or health-check the wiki, check for:

- broken links,
- orphan pages,
- missing index entries,
- stale or contradicted content,
- missing frontmatter,
- outdated `last_updated` values,
- missing cross-links between related pages,
- pages that should be split or merged.

Prefer fixing small issues directly and summarizing larger recommendations.

Use the bundled script when available:

```sh
ai/scripts/wiki-lint.sh
```

The script checks for missing topic-page frontmatter, broken relative Markdown links, and topic pages missing from `wiki/index.md`.

In adopted projects, use `ai/scripts/wiki-lint.sh --warn-placeholders` to surface leftover `TODO` and `YYYY-MM-DD` wiki placeholders without failing, or `--strict-placeholders` when unfinished placeholders should fail validation. Keep the default lint compatible with starter wiki templates, which intentionally include placeholders.
