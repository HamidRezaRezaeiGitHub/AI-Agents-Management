# Hooks

Use hooks for checks that should be deterministic.

Good hook candidates:

- block commits containing secrets,
- run formatters after edits,
- run targeted tests after file changes,
- prevent writes to generated files,
- log tool usage for audit.

Avoid hooks for vague preferences. Put those in instructions until they can be expressed as a check.
