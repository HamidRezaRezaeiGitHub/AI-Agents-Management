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
  "$target/ai/prompts/adoption" \
  "$target/wiki/architecture" \
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

ensure_gitignore_entry() {
  entry=$1
  file="$target/.gitignore"

  if [ ! -f "$file" ]; then
    touch "$file"
  fi

  if ! grep -qx "$entry" "$file"; then
    printf "\n%s\n" "$entry" >> "$file"
    echo "updated $file with $entry"
  fi
}

copy_if_missing "$pack/root/AGENTS.md" "$target/AGENTS.md"
copy_if_missing "$pack/root/CLAUDE.md" "$target/CLAUDE.md"
copy_if_missing "$pack/root/GEMINI.md" "$target/GEMINI.md"
copy_if_missing "$pack/root/.github/copilot-instructions.md" "$target/.github/copilot-instructions.md"
copy_if_missing "$pack/root/.github/instructions/wiki.instructions.md" "$target/.github/instructions/wiki.instructions.md"
copy_if_missing "$pack/root/.github/instructions/architecture.instructions.md" "$target/.github/instructions/architecture.instructions.md"
copy_if_missing "$pack/root/.github/instructions/ci-validation.instructions.md" "$target/.github/instructions/ci-validation.instructions.md"
copy_if_missing "$pack/root/.github/instructions/testing-quality.instructions.md" "$target/.github/instructions/testing-quality.instructions.md"
copy_if_missing "$pack/ai/pack.yaml" "$target/ai/pack.yaml"
copy_if_missing "$pack/ai/workflows/requirement-planning.md" "$target/ai/workflows/requirement-planning.md"
copy_if_missing "$pack/ai/workflows/wiki-documentation.md" "$target/ai/workflows/wiki-documentation.md"
copy_if_missing "$pack/ai/workflows/architecture.md" "$target/ai/workflows/architecture.md"
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
copy_if_missing "$pack/wiki/architecture/system-overview.md" "$target/wiki/architecture/system-overview.md"
copy_if_missing "$pack/wiki/architecture/tech-stack.md" "$target/wiki/architecture/tech-stack.md"
copy_if_missing "$pack/wiki/architecture/data-flow.md" "$target/wiki/architecture/data-flow.md"
copy_if_missing "$pack/wiki/architecture/integration-points.md" "$target/wiki/architecture/integration-points.md"
copy_if_missing "$pack/wiki/architecture/decisions.md" "$target/wiki/architecture/decisions.md"
copy_if_missing "$pack/wiki/guides/testing.md" "$target/wiki/guides/testing.md"
copy_if_missing "$pack/ai/scripts/start-requirement.sh" "$target/ai/scripts/start-requirement.sh"
copy_if_missing "$pack/ai/scripts/audit-adoption.sh" "$target/ai/scripts/audit-adoption.sh"
copy_if_missing "$pack/ai/scripts/wiki-lint.sh" "$target/ai/scripts/wiki-lint.sh"
copy_if_missing "$pack/ai/hooks/pre-commit-block-requirements.sh" "$target/ai/hooks/pre-commit-block-requirements.sh"
copy_if_missing "$pack/claude/commands/start-requirement.md" "$target/.claude/commands/start-requirement.md"
copy_if_missing "$pack/ai/prompts/adoption/empty-project.md" "$target/ai/prompts/adoption/empty-project.md"
copy_if_missing "$pack/ai/prompts/adoption/first-time-existing-instructions.md" "$target/ai/prompts/adoption/first-time-existing-instructions.md"
copy_if_missing "$pack/ai/prompts/adoption/update-existing-pack.md" "$target/ai/prompts/adoption/update-existing-pack.md"
copy_if_missing "$pack/ai/prompts/adoption/temp-install-review.md" "$target/ai/prompts/adoption/temp-install-review.md"
ensure_gitignore_entry "requirements/"

chmod +x "$target/ai/scripts/start-requirement.sh"
chmod +x "$target/ai/scripts/audit-adoption.sh"
chmod +x "$target/ai/scripts/wiki-lint.sh"
chmod +x "$target/ai/hooks/pre-commit-block-requirements.sh"

echo "Done. Customize TODOs in the target project's agent instruction files."
