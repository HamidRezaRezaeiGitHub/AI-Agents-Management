---
allowed-tools: Bash(ai/scripts/start-requirement.sh:*), Read, Edit
description: Start or resume a local requirement workspace with PLAN.md and a requirement branch.
---

# Start Requirement

Run the requirement planning workflow for: `$ARGUMENTS`

Use `ai/scripts/start-requirement.sh "$ARGUMENTS"` when a title is provided. If no title is provided, infer a concise title from the active task, then use the script.

After the script runs:

- read the generated `requirements/<slug>/PLAN.md`,
- update TODOs with the user's requirement and first plan,
- confirm the current branch matches the plan,
- continue from the plan.
