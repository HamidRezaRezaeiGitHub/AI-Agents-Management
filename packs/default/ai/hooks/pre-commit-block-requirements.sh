#!/bin/sh
set -eu

if git diff --cached --name-only | grep -q '^requirements/'; then
  echo "Do not commit local requirement workspace files under requirements/." >&2
  exit 1
fi
