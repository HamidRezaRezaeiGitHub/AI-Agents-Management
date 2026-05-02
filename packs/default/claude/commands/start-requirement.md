---
allowed-tools: Bash(ai/scripts/start-requirement.sh:*), Read, Edit
description: Start or resume a local requirement workspace with PLAN.md and a requirement branch.
---

# Start Requirement

Run the requirement planning workflow for: `$ARGUMENTS`

Use `ai/scripts/start-requirement.sh "$ARGUMENTS"` when a title is provided. If no title is provided, infer a concise title from the active task, then use the script.

By default the script creates or switches to the expected requirement branch. If the current branch is already the right feature branch for this work, use `ai/scripts/start-requirement.sh --stay-on-current-branch "$ARGUMENTS"` instead and record that branch choice in `PLAN.md`.

After the script runs:

- read the generated `requirements/<slug>/PLAN.md`,
- read the generated `requirements/<slug>/FINDINGS.md`,
- update TODOs with the user's requirement and first plan,
- confirm the current branch matches the plan or that `--stay-on-current-branch` was intentional,
- continue from the plan.
