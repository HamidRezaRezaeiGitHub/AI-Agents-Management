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

mkdir -p "$target/.github/instructions" "$target/.claude" "$target/.gemini"

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

copy_if_missing "ai/templates/project/AGENTS.md" "$target/AGENTS.md"
copy_if_missing "ai/templates/project/CLAUDE.md" "$target/CLAUDE.md"
copy_if_missing "ai/templates/project/GEMINI.md" "$target/GEMINI.md"
copy_if_missing "ai/templates/project/copilot-instructions.md" "$target/.github/copilot-instructions.md"

echo "Done. Customize TODOs in the target project's agent instruction files."
