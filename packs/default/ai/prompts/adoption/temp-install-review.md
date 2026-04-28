# Prompt: Review Temp Install Before Migration

Use this when you installed the pack into a temporary folder under a target project and want an agent to plan the migration.

```text
Review the temporary AI agent pack installation and plan a safe migration into this project.

The temporary install is at: TODO path, for example `tmp/agent-pack-install/`.

Do not immediately copy files over existing instructions. First compare the temporary pack files with the project's current agent files, docs, wiki, CI config, and test guidance.

Produce a migration plan in the local requirement workspace that explains:
- which files should be copied as-is,
- which files need merging,
- which existing files should be preserved,
- which existing files are stale or duplicated,
- what project-specific content belongs in wiki pages,
- what validation must pass before the migration is complete.

After the plan is clear, perform the migration carefully and run adoption audit plus relevant project validation.
```
