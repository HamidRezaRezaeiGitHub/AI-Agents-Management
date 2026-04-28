---
name: ci-validation
use_when: Before finishing implementation work, before code review, and before committing or opening a pull request.
reads:
  - .github/workflows/
  - Jenkinsfile
  - ai/workflows/command-execution.md
writes:
  - requirements/<slug>/PLAN.md
strictness: required_before_completion
---

# CI Validation Workflow

Use this workflow before finishing implementation work, before code review, and especially before committing or opening a pull request.

## Goal

The agent should leave the repository in a state that is expected to pass the project's configured Continuous Integration checks.

## Discover CI Expectations

Review existing CI configuration instead of inventing generic commands.

Look for:

- `.github/workflows/*.yml`
- `.github/workflows/*.yaml`
- `Jenkinsfile`
- `.gitlab-ci.yml`
- `.circleci/config.yml`
- `azure-pipelines.yml`
- build scripts or task runners referenced by those files
- project docs or wiki pages about CI, release, deployment, or validation

If a project wiki exists, start with `wiki/index.md` and any testing, CI/CD, development, or operations pages.

## Local Validation

Before finishing:

1. Identify the relevant CI checks for the files changed.
2. Run the smallest meaningful local equivalent first.
3. Run broader validation when shared code, build configuration, public API, or cross-cutting behavior changed.
4. Use `ai/workflows/command-execution.md` to keep output concise.
5. If a required check cannot be run locally, state why and what would need to run in CI.

## Before Commit Or PR

- Run tests relevant to the change.
- Run formatter/linter/typecheck/build checks when the project has them.
- Check that generated files, lockfiles, and dependency changes are intentional.
- Do not modify CI files unless the user requested it or the requirement requires it.
- Do not claim CI will pass unless equivalent checks were run or the limitations are clearly stated.

## Failure Handling

If validation fails:

- read enough output to understand the failure,
- fix failures caused by the current change,
- do not hide failures by skipping tests or weakening assertions,
- document unrelated pre-existing failures separately.
