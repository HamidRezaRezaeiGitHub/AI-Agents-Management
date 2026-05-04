# Domain-Driven Design Adoption Assessment

Source: [Domain-Driven Design by Eric Evans](https://www.domainlanguage.com/ddd/)

Estimated adoption: **about 45%**

## Core Idea

Domain-Driven Design is an approach for building software in complex domains by centering the team's attention on domain knowledge, models, and a shared language between domain experts and developers. Its better-known tactical and strategic ideas include ubiquitous language, model-driven design, bounded contexts, context mapping, aggregates, entities, value objects, repositories, services, and distillation of the core domain.

## Community Feedback Categories

- **Praised: shared domain language.** DDD's ubiquitous language gives domain experts and developers a common, rigorous vocabulary that can be used in conversation, documentation, tests, and code. Sources: [Martin Fowler on Ubiquitous Language](https://martinfowler.com/bliki/UbiquitousLanguage.html), [DDD Reference](https://www.domainlanguage.com/ddd/reference/).
- **Praised: boundaries for model consistency.** Bounded contexts help large systems avoid one overloaded model by defining where a particular language and model apply. Sources: [Martin Fowler on Bounded Context](https://martinfowler.com/bliki/BoundedContext.html), [DevIQ Bounded Context](https://deviq.com/domain-driven-design/bounded-context/).
- **Praised: focus on complex business domains.** Evans' reference and later summaries frame DDD as most useful when software must reflect tricky domain knowledge rather than only technical CRUD behavior. Sources: [DDD Reference](https://www.domainlanguage.com/ddd/reference/), [Google Books summary](https://books.google.com/books/about/Domain_driven_Design.html?id=xColAAPGubgC).
- **Praised: collaboration between domain and software practitioners.** DDD emphasizes creative collaboration with domain experts so models improve as understanding grows. Sources: [Martin Fowler on Ubiquitous Language](https://martinfowler.com/bliki/UbiquitousLanguage.html), [Secure by Design excerpt](https://livebook.manning.com/book/secure-by-design/chapter-3).
- **Praised: useful architecture vocabulary.** Patterns such as bounded context, anti-corruption layer, shared kernel, and context map give teams language for integration and team boundaries. Sources: [DDD Reference](https://www.domainlanguage.com/ddd/reference/), [DevIQ Bounded Context](https://deviq.com/domain-driven-design/bounded-context/).
- **Criticized: overkill for simple domains.** DDD is aimed at complex domains; applying its full pattern language to simple CRUD systems can add unnecessary conceptual overhead. Sources: [DDD Reference](https://www.domainlanguage.com/ddd/reference/), [Secure by Design excerpt](https://livebook.manning.com/book/secure-by-design/chapter-3).
- **Criticized: terminology can become ceremony.** Community summaries often reduce DDD to vocabulary lists, which risks turning modeling into jargon if teams do not validate terms with domain experts. Sources: [Chaine DDD handbook](https://handbook.chaineapp.com/handbook/engineering/resources/ddd/domain-driven-design-handbook/), [Martin Fowler on Ubiquitous Language](https://martinfowler.com/bliki/UbiquitousLanguage.html).
- **Criticized: implementation alignment is hard.** DDD's value depends on keeping model, language, documentation, tests, and code aligned as the domain evolves, which requires ongoing discipline. Sources: [Martin Fowler on Ubiquitous Language](https://martinfowler.com/bliki/UbiquitousLanguage.html), [DDD Reference](https://www.domainlanguage.com/ddd/reference/).

## Adoption In This Project

`man-agent-ment` adopts the ubiquitous-language slice of DDD strongly. The default pack includes `wiki/domain/ubiquitous-language.md`, workflow guidance for preserving canonical domain terms, and `vibe-coding-translation` rules that map stakeholder language into concrete requirements while preserving domain meaning. `wiki-documentation` tells agents to promote durable domain terms, synonyms, ambiguities, and relationships into the project wiki, and requirement planning keeps unsettled terminology in `FINDINGS.md` until it is stable enough to promote.

The pack does not adopt the full DDD method. It does not ship bounded-context or context-map templates, aggregate/entity/value-object modeling guidance, anti-corruption-layer patterns, event storming prompts, domain service/repository rules, or core-domain distillation workflows. Its DDD use is pragmatic and documentation-focused: keep agents from drifting away from stakeholder language and preserve reusable domain vocabulary across prompts, wiki pages, tests, and code discussion.
