#!/bin/sh
set -eu

expected_version="0.4.3"
status=0

check_file() {
  path=$1

  if [ -e "$path" ]; then
    echo "ok      $path"
  else
    echo "missing $path"
    status=1
  fi
}

check_executable() {
  path=$1

  if [ -x "$path" ]; then
    echo "ok      $path executable"
  else
    echo "missing $path executable bit"
    status=1
  fi
}

check_file "AGENTS.md"
check_file "CLAUDE.md"
check_file "GEMINI.md"
check_file ".github/copilot-instructions.md"
check_file ".github/instructions/wiki.instructions.md"
check_file ".github/instructions/architecture.instructions.md"
check_file ".github/instructions/ci-validation.instructions.md"
check_file ".github/instructions/testing-quality.instructions.md"
check_file ".github/instructions/code-review.instructions.md"
check_file ".claude/commands/start-requirement.md"
check_file "ai/README.md"
check_file "ai/pack.yaml"
check_file "ai/workflows/workflow-dispatch.md"
check_file "ai/workflows/requirement-planning.md"
check_file "ai/workflows/wiki-documentation.md"
check_file "ai/workflows/architecture.md"
check_file "ai/workflows/command-execution.md"
check_file "ai/workflows/ci-validation.md"
check_file "ai/workflows/testing-quality.md"
check_file "ai/workflows/code-review.md"
check_file "ai/workflows/vibe-coding-translation.md"
check_file "ai/templates/requirement/PLAN.md"
check_file "ai/templates/requirement/FINDINGS.md"
check_file "ai/templates/wiki/index.md"
check_file "ai/templates/wiki/log.md"
check_file "ai/templates/wiki/page.md"
check_file "ai/scripts/start-requirement.sh"
check_file "ai/scripts/audit-adoption.sh"
check_file "ai/scripts/wiki-lint.sh"
check_file "ai/hooks/pre-commit-block-requirements.sh"
check_file "ai/prompts/adoption/empty-project.md"
check_file "ai/prompts/adoption/first-time-existing-instructions.md"
check_file "ai/prompts/adoption/update-existing-pack.md"
check_file "ai/prompts/adoption/temp-install-review.md"
check_file "wiki/index.md"
check_file "wiki/log.md"
check_file "wiki/architecture/system-overview.md"
check_file "wiki/architecture/tech-stack.md"
check_file "wiki/architecture/data-flow.md"
check_file "wiki/architecture/integration-points.md"
check_file "wiki/architecture/decisions.md"
check_file "wiki/guides/testing.md"

check_executable "ai/scripts/start-requirement.sh"
check_executable "ai/scripts/audit-adoption.sh"
check_executable "ai/scripts/wiki-lint.sh"

if [ -f "ai/pack.yaml" ]; then
  installed_version=$(sed -n 's/^version:[ ]*//p' ai/pack.yaml | sed -n '1p')

  if [ "$installed_version" = "$expected_version" ]; then
    echo "ok      pack version $installed_version"
  else
    echo "warning pack version $installed_version, expected $expected_version"
    status=1
  fi
fi

if [ -f ".gitignore" ] && grep -qx "requirements/" .gitignore; then
  echo "ok      requirements/ ignored"
else
  echo "missing requirements/ in .gitignore"
  status=1
fi

exit "$status"
