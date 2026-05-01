#!/bin/sh
set -eu

usage() {
  exit_code=${1:-2}

  cat >&2 <<'USAGE'
Usage: ai/scripts/list-requirements.sh [options]

List local requirement workspaces from requirements/*/PLAN.md.

Options:
  --limit N             Show at most N requirements. Default: 10.
  --sort FIELD          Sort by created, modified, status, or slug. Default: modified.
  --status STATUS       Show only requirements with this status.
  --open                Show statuses other than complete, implemented, cancelled, canceled, closed, or done.
  --all                 Show all matching requirements. Overrides --limit.
  --help                Show this help.

Examples:
  ai/scripts/list-requirements.sh --sort created --limit 10
  ai/scripts/list-requirements.sh --sort modified --limit 10
  ai/scripts/list-requirements.sh --status active --sort modified --limit 10
  ai/scripts/list-requirements.sh --open
USAGE
  exit "$exit_code"
}

limit=10
sort_field=modified
status_filter=
open_only=no
show_all=no

while [ "$#" -gt 0 ]; do
  case "$1" in
    --limit)
      [ "$#" -ge 2 ] || usage
      limit=$2
      shift 2
      ;;
    --sort)
      [ "$#" -ge 2 ] || usage
      sort_field=$2
      shift 2
      ;;
    --status)
      [ "$#" -ge 2 ] || usage
      status_filter=$2
      shift 2
      ;;
    --open)
      open_only=yes
      shift
      ;;
    --all)
      show_all=yes
      shift
      ;;
    --help|-h)
      usage 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      ;;
  esac
done

case "$sort_field" in
  created|modified|updated|status|slug)
    ;;
  *)
    echo "Unsupported sort field: $sort_field" >&2
    usage
    ;;
esac

case "$limit" in
  ''|*[!0-9]*)
    echo "--limit must be a non-negative integer" >&2
    exit 2
    ;;
esac

if [ "$sort_field" = "updated" ]; then
  sort_field=modified
fi

if [ ! -d requirements ]; then
  echo "No requirements/ directory found." >&2
  exit 0
fi

tmp=${TMPDIR:-/tmp}/list-requirements.$$
trap 'rm -f "$tmp"' EXIT HUP INT TERM

found=no

for plan in requirements/*/PLAN.md; do
  [ -f "$plan" ] || continue
  found=yes

  title=$(sed -n 's/^# Requirement Plan: //p' "$plan" | sed -n '1p')
  slug=$(sed -n 's/^- Slug: `\(.*\)`/\1/p' "$plan" | sed -n '1p')
  branch=$(sed -n 's/^- Expected branch: `\(.*\)`/\1/p' "$plan" | sed -n '1p')
  created=$(sed -n 's/^- Created: `\{0,1\}\([^`]*\)`\{0,1\}/\1/p' "$plan" | sed -n '1p')
  modified=$(sed -n 's/^- Last modified: `\{0,1\}\([^`]*\)`\{0,1\}/\1/p' "$plan" | sed -n '1p')
  status=$(sed -n 's/^- Status: `\{0,1\}\([^`]*\)`\{0,1\}/\1/p' "$plan" | sed -n '1p')

  if [ -z "$slug" ]; then
    slug=${plan#requirements/}
    slug=${slug%/PLAN.md}
  fi

  if [ -z "$title" ]; then
    title=$slug
  fi

  if [ -z "$created" ]; then
    created=unknown
  fi

  if [ -z "$modified" ]; then
    modified=$created
  fi

  if [ -z "$status" ]; then
    status=unknown
  fi

  if [ -n "$status_filter" ] && [ "$status" != "$status_filter" ]; then
    continue
  fi

  if [ "$open_only" = yes ]; then
    case "$status" in
      complete|implemented|cancelled|canceled|closed|done)
        continue
        ;;
    esac
  fi

  case "$sort_field" in
    created)
      sort_key=$created
      ;;
    modified)
      sort_key=$modified
      ;;
    status)
      sort_key=$status
      ;;
    slug)
      sort_key=$slug
      ;;
  esac

  printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
    "$sort_key" "$status" "$created" "$modified" "$slug" "$branch" "$title" >> "$tmp"
done

if [ "$found" = no ]; then
  echo "No requirement plans found under requirements/." >&2
  exit 0
fi

printf 'STATUS\tCREATED\tMODIFIED\tSLUG\tBRANCH\tTITLE\n'

if [ ! -s "$tmp" ]; then
  exit 0
fi

if [ "$sort_field" = "status" ] || [ "$sort_field" = "slug" ]; then
  sorted=$(sort "$tmp")
else
  sorted=$(sort -r "$tmp")
fi

if [ "$show_all" = yes ]; then
  printf '%s\n' "$sorted" | cut -f2-
elif [ "$limit" = 0 ]; then
  exit 0
else
  printf '%s\n' "$sorted" | sed -n "1,${limit}p" | cut -f2-
fi
