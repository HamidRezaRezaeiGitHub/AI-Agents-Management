# MetaGPT And ChatDev Adoption Assessment

Sources: [MetaGPT](https://github.com/geekan/MetaGPT), [ChatDev](https://github.com/OpenBMB/ChatDev)

Estimated adoption: **about 50%**

## Core Idea

MetaGPT and ChatDev model software development as a multi-agent organization. They assign specialized roles such as product manager, architect, engineer, tester, reviewer, CEO, CTO, and programmer, then route work through staged artifacts such as requirements, designs, tasks, code, tests, and documentation. MetaGPT emphasizes SOP-based collaboration, while ChatDev emphasizes a virtual software company with role-based seminars across the software lifecycle.

## Community Feedback Categories

- **Praised: role specialization.** Both projects show that assigning specialized roles can make agent outputs more structured than a single free-form assistant conversation. Sources: [MetaGPT README](https://github.com/geekan/MetaGPT), [ChatDev homepage](https://chatdev.ai/).
- **Praised: SOP and artifact discipline.** MetaGPT's public materials frame `Code = SOP(Team)` as the core philosophy, while ChatDev uses staged phases for designing, coding, testing, and documenting. Sources: [MetaGPT docs](https://docs.deepwisdom.ai/main/en/guide/get_started/introduction.html), [IBM ChatDev overview](https://www.ibm.com/think/topics/chatdev).
- **Praised: intermediate deliverables.** MetaGPT produces requirements, product documents, architecture, APIs, and code artifacts, which gives later agents more concrete handoff material. Sources: [MetaGPT README](https://github.com/geekan/MetaGPT), [IBM MetaGPT overview](https://www.ibm.com/think/topics/metagpt).
- **Praised: research influence.** MetaGPT and ChatDev are widely cited examples of applying multi-agent collaboration to software engineering and collective intelligence research. Sources: [MetaGPT paper page](https://huggingface.co/papers/2308.00352), [ChatDev paper](https://arxiv.org/abs/2307.07924).
- **Praised: reduced role confusion through structure.** Summaries credit MetaGPT's shared message pool and SOPs with reducing free-form multi-agent cross-talk and cascading hallucination compared with looser agent conversations. Source: [AgentWiki MetaGPT summary](https://agentwiki.org/metagpt).
- **Criticized: heavy process overhead.** Multi-role software-company simulations can create many documents and steps, which may be disproportionate for small fixes or routine repository work. Sources: [MetaGPT README](https://github.com/geekan/MetaGPT), [ChatDev homepage](https://chatdev.ai/).
- **Criticized: agent theater risk.** The company metaphor can make agents appear organized while still requiring human review of requirements, architecture, implementation, tests, and generated docs. Sources: [AgentWiki MetaGPT summary](https://agentwiki.org/metagpt), [IBM ChatDev overview](https://www.ibm.com/think/topics/chatdev).
- **Criticized: framework setup and runtime complexity.** Running full multi-agent frameworks requires dependencies, configuration, model access, and orchestration beyond simple project instructions. Sources: [MetaGPT docs](https://docs.deepwisdom.ai/main/en/guide/get_started/introduction.html), [ChatDev homepage](https://chatdev.ai/).

## Adoption In This Project

`man-agent-ment` adopts the useful part of the multi-role idea as lightweight workflow lenses. `vibe-coding-translation` covers a product/requirements lens, `architecture` covers an architect lens, `testing-quality` covers a QA lens, `code-review` covers reviewer lenses, and `requirement-planning` turns intermediate assumptions into explicit handoff artifacts. The pack also leaves room for reusable agent definitions under `ai/agents/`.

The pack intentionally avoids simulating a full software company. It does not orchestrate multiple autonomous agents by default, require product-manager/architect/engineer/tester phases for every change, maintain a shared agent message pool, run role seminars, or generate full PRD/design/task/code/doc pipelines from a one-line prompt. Its process routing keeps quick work lightweight and applies stronger role-like checks only when complexity or risk justifies them.
