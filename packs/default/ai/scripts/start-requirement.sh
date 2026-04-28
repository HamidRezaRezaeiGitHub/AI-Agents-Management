#!/bin/sh
set -eu

usage() {
  echo "Usage: ai/scripts/start-requirement.sh \"Requirement Title\"" >&2
  exit 2
}

escape_sed_replacement() {
  printf "%s" "$1" | sed 's/[\/&|\\]/\\&/g'
}

if [ "$#" -ne 1 ]; then
  usage
fi

title=$1

slug=$(printf "%s" "$title" \
  | tr '[:upper:]' '[:lower:]' \
  | sed 's/[^a-z0-9][^a-z0-9]*/-/g' \
  | sed 's/^-//' \
  | sed 's/-$//')

if [ -z "$slug" ]; then
  echo "Could not derive a requirement slug from title: $title" >&2
  exit 1
fi

if [ ! -d .git ]; then
  echo "This script must be run from a git repository root." >&2
  exit 1
fi

if [ ! -f .gitignore ]; then
  touch .gitignore
fi

if ! grep -qx "requirements/" .gitignore; then
  printf "\nrequirements/\n" >> .gitignore
  echo "added requirements/ to .gitignore"
fi

workspace="requirements/$slug"
plan="$workspace/PLAN.md"
findings="$workspace/FINDINGS.md"
branch="feature/$slug"
fallback_branch=$slug
current_branch=$(git branch --show-current)

mkdir -p "$workspace"

if [ -f "$plan" ]; then
  expected_branch=$(sed -n 's/^- Expected branch: `\(.*\)`/\1/p' "$plan" | sed -n '1p')

  if [ -n "$expected_branch" ]; then
    branch=$expected_branch
  fi
fi

if [ "$current_branch" = "$branch" ]; then
  :
elif [ "$current_branch" = "$fallback_branch" ] && [ "$branch" = "feature/$slug" ]; then
  branch=$current_branch
elif [ "$current_branch" = "main" ] || [ "$current_branch" = "master" ]; then
  if git show-ref --verify --quiet "refs/heads/$branch"; then
    git switch "$branch"
  else
    if git switch -c "$branch" 2>/dev/null; then
      :
    else
      echo "could not create $branch; trying $fallback_branch" >&2
      if git show-ref --verify --quiet "refs/heads/$fallback_branch"; then
        git switch "$fallback_branch"
      else
        git switch -c "$fallback_branch"
      fi
      branch=$fallback_branch
    fi
  fi
else
  if git show-ref --verify --quiet "refs/heads/$branch"; then
    git switch "$branch"
  else
    if git switch -c "$branch" 2>/dev/null; then
      :
    else
      echo "could not create $branch; trying $fallback_branch" >&2
      if git show-ref --verify --quiet "refs/heads/$fallback_branch"; then
        git switch "$fallback_branch"
      else
        git switch -c "$fallback_branch"
      fi
      branch=$fallback_branch
    fi
  fi
fi

if [ ! -f "$plan" ]; then
  created_at=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  template="ai/templates/requirement/PLAN.md"

  if [ ! -f "$template" ] && [ -f "packs/default/ai/templates/requirement/PLAN.md" ]; then
    template="packs/default/ai/templates/requirement/PLAN.md"
  fi

  escaped_title=$(escape_sed_replacement "$title")
  escaped_slug=$(escape_sed_replacement "$slug")
  escaped_branch=$(escape_sed_replacement "$branch")
  escaped_created_at=$(escape_sed_replacement "$created_at")

  if [ ! -f "$template" ]; then
    echo "Missing template: $template" >&2
    exit 1
  fi

  sed \
    -e "s|{{TITLE}}|$escaped_title|g" \
    -e "s|{{SLUG}}|$escaped_slug|g" \
    -e "s|{{BRANCH}}|$escaped_branch|g" \
    -e "s|{{CREATED_AT}}|$escaped_created_at|g" \
    "$template" > "$plan"
  echo "created $plan"
else
  echo "found existing $plan"
fi

if [ ! -f "$findings" ]; then
  template="ai/templates/requirement/FINDINGS.md"

  if [ ! -f "$template" ] && [ -f "packs/default/ai/templates/requirement/FINDINGS.md" ]; then
    template="packs/default/ai/templates/requirement/FINDINGS.md"
  fi

  escaped_title=$(escape_sed_replacement "$title")

  if [ ! -f "$template" ]; then
    echo "Missing template: $template" >&2
    exit 1
  fi

  sed \
    -e "s|{{TITLE}}|$escaped_title|g" \
    "$template" > "$findings"
  echo "created $findings"
else
  echo "found existing $findings"
fi

echo "Requirement workspace: $workspace"
echo "Plan: $plan"
echo "Findings: $findings"
echo "Branch: $branch"
