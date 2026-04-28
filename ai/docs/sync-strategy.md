# Sync Strategy

The goal is high instruction-sync performance across agents without creating a maintenance trap.

## Source Of Truth

Use this split:

- Central shared behavior: `ai/shared/agent-operating-contract.md`.
- Tool discovery facts: `ai/docs/agent-discovery-matrix.md`.
- Target-project facts: each target repo's native files.

Do not try to keep every target repo identical. Shared behavior should sync; project-specific commands and architecture should diverge.

## Recommended Adoption Modes

### Copy Mode

Copy starter files into the target repo, then customize them.

Best for most projects because agent instructions should travel with the code and be visible in pull requests.

### Submodule Or Subtree Mode

Keep this repo mounted under a target repo, then point native files at it.

Useful for organizations, but only if all agents can reliably read the referenced path. For critical rules, keep a short copy in the native file.

### Generated Mode

Generate native files from templates and project metadata.

Useful later, once repeated manual edits reveal stable fields. Avoid early automation until the shape has proven itself.

## Drift Control

- Keep shared rules short.
- Put target-specific facts in target repos.
- Add a quarterly review reminder for central docs.
- Add an instruction-audit command in each important repo.
- Prefer hooks/CI for enforceable policy.
- Track changes to this pack with a version in `ai/manifest.yaml`.

## Determinism Limits

No instruction file can force perfect compliance. Better results come from layered controls:

- auto-discovered native files,
- explicit task prompts,
- small scoped rules,
- validation commands,
- hooks,
- CI,
- human review.

Use instructions to guide decisions. Use automation to enforce requirements.
