#!/bin/sh
set -eu

wiki_dir=${1:-wiki}
status=0

if [ ! -d "$wiki_dir" ]; then
  echo "missing wiki directory: $wiki_dir" >&2
  exit 1
fi

check_frontmatter() {
  file=$1
  name=$(basename "$file")

  if [ "$name" = "index.md" ] || [ "$name" = "log.md" ]; then
    return
  fi

  if ! sed -n '1p' "$file" | grep -qx -- "---"; then
    echo "frontmatter missing opening ---: $file"
    status=1
    return
  fi

  for key in title domain tags status last_updated; do
    if ! sed -n '1,20p' "$file" | grep -q "^$key:"; then
      echo "frontmatter missing $key: $file"
      status=1
    fi
  done
}

check_links() {
  file=$1
  dir=$(dirname "$file")
  link_status=0
  links_tmp=$(mktemp)

  grep -oE '\[[^]]+\]\([^)]+\)' "$file" > "$links_tmp" 2>/dev/null || true

  while IFS= read -r link; do
    target=$(printf "%s" "$link" | sed 's/^.*](//; s/)$//')

    case "$target" in
      http://*|https://*|mailto:*|\#*|"")
        continue
        ;;
    esac

    target_no_anchor=$(printf "%s" "$target" | sed 's/#.*$//')

    if [ -z "$target_no_anchor" ]; then
      continue
    fi

    if [ ! -e "$dir/$target_no_anchor" ]; then
      echo "broken link in $file -> $target"
      link_status=1
    fi

  done < "$links_tmp"

  rm -f "$links_tmp"
  return "$link_status"
}

check_index_entry() {
  file=$1
  rel=${file#"$wiki_dir/"}
  name=$(basename "$file")

  if [ "$name" = "index.md" ] || [ "$name" = "log.md" ]; then
    return
  fi

  if [ -f "$wiki_dir/index.md" ] && ! grep -q "$rel" "$wiki_dir/index.md"; then
    echo "missing index entry: $rel"
    status=1
  fi
}

tmp_files=$(mktemp)
find "$wiki_dir" -name '*.md' -type f | sort > "$tmp_files"

while IFS= read -r file; do
  check_frontmatter "$file"
  check_index_entry "$file"
  if ! check_links "$file"; then
    status=1
  fi
done < "$tmp_files"

rm -f "$tmp_files"

if [ "$status" -eq 0 ]; then
  echo "wiki lint passed: $wiki_dir"
fi

exit "$status"
