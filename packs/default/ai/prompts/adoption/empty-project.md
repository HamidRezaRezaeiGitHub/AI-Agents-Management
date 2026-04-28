# Prompt: Adopt Pack In A Clean Project

Use this when the target project has source code but no existing AI-agent instruction system.

```text
Adopt the AI agent instruction pack into this project.

First inspect the repository structure, README, package/build files, CI configuration, and existing docs. Then verify the installed pack files. Customize the copied instructions so they accurately describe this project without adding technology-specific guesses.

Create a local requirement workspace for this migration, work on a feature branch, and update the plan as you discover project facts.

Make sure:
- native agent files are present and concise,
- `ai/README.md` gives a clear workflow map,
- `requirements/` is ignored,
- wiki starter files exist,
- validation commands are discovered from the project and CI config,
- architecture and testing wiki starter pages are either customized or clearly marked as draft,
- no secrets or local-only paths are introduced.

Do not remove source files or change app behavior.
```
