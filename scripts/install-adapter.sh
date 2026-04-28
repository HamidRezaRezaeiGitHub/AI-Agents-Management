#!/bin/sh
set -eu

if [ "$#" -ne 1 ]; then
  echo "Usage: scripts/install-adapter.sh /path/to/target-project" >&2
  exit 2
fi

target=$1

if [ ! -d "$target" ]; then
  echo "Target directory does not exist: $target" >&2
  exit 1
fi

pack="packs/default"

mkdir -p \
  "$target/.github/instructions" \
  "$target/.claude/commands" \
  "$target/.gemini" \
  "$target/ai/workflows" \
  "$target/ai/templates/requirement" \
  "$target/ai/templates/wiki" \
  "$target/ai/scripts" \
  "$target/ai/hooks" \
  "$target/wiki/guides"

copy_if_missing() {
  source=$1
  destination=$2

  if [ -e "$destination" ]; then
    echo "skip existing $destination"
  else
    cp "$source" "$destination"
    echo "created $destination"
  fi
}

copy_if_missing "$pack/root/AGENTS.md" "$target/AGENTS.md"
copy_if_missing "$pack/root/CLAUDE.md" "$target/CLAUDE.md"
copy_if_missing "$pack/root/GEMINI.md" "$target/GEMINI.md"
copy_if_missing "$pack/root/.github/copilot-instructions.md" "$target/.github/copilot-instructions.md"
copy_if_missing "$pack/root/.github/instructions/wiki.instructions.md" "$target/.github/instructions/wiki.instructions.md"
copy_if_missing "$pack/root/.github/instructions/ci-validation.instructions.md" "$target/.github/instructions/ci-validation.instructions.md"
copy_if_missing "$pack/root/.github/instructions/testing-quality.instructions.md" "$target/.github/instructions/testing-quality.instructions.md"
copy_if_missing "$pack/ai/workflows/requirement-planning.md" "$target/ai/workflows/requirement-planning.md"
copy_if_missing "$pack/ai/workflows/wiki-documentation.md" "$target/ai/workflows/wiki-documentation.md"
copy_if_missing "$pack/ai/workflows/command-execution.md" "$target/ai/workflows/command-execution.md"
copy_if_missing "$pack/ai/workflows/ci-validation.md" "$target/ai/workflows/ci-validation.md"
copy_if_missing "$pack/ai/workflows/testing-quality.md" "$target/ai/workflows/testing-quality.md"
copy_if_missing "$pack/ai/workflows/vibe-coding-translation.md" "$target/ai/workflows/vibe-coding-translation.md"
copy_if_missing "$pack/ai/templates/requirement/PLAN.md" "$target/ai/templates/requirement/PLAN.md"
copy_if_missing "$pack/ai/templates/wiki/index.md" "$target/ai/templates/wiki/index.md"
copy_if_missing "$pack/ai/templates/wiki/log.md" "$target/ai/templates/wiki/log.md"
copy_if_missing "$pack/ai/templates/wiki/page.md" "$target/ai/templates/wiki/page.md"
copy_if_missing "$pack/wiki/index.md" "$target/wiki/index.md"
copy_if_missing "$pack/wiki/log.md" "$target/wiki/log.md"
copy_if_missing "$pack/wiki/guides/testing.md" "$target/wiki/guides/testing.md"
copy_if_missing "$pack/ai/scripts/start-requirement.sh" "$target/ai/scripts/start-requirement.sh"
copy_if_missing "$pack/ai/hooks/pre-commit-block-requirements.sh" "$target/ai/hooks/pre-commit-block-requirements.sh"
copy_if_missing "$pack/claude/commands/start-requirement.md" "$target/.claude/commands/start-requirement.md"

chmod +x "$target/ai/scripts/start-requirement.sh"
chmod +x "$target/ai/hooks/pre-commit-block-requirements.sh"

echo "Done. Customize TODOs in the target project's agent instruction files."
