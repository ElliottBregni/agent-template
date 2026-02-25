#!/bin/bash
# PostToolUse hook: auto-lint after file edits
# Reads JSON from stdin with tool_name and file_path

INPUT=$(cat)
TOOL=$(echo "$INPUT" | jq -r '.tool_name // empty')
FILE=$(echo "$INPUT" | jq -r '.input.file_path // empty')

if [[ "$TOOL" != "Edit" && "$TOOL" != "Write" ]]; then
  exit 0
fi

if [[ -z "$FILE" || ! -f "$FILE" ]]; then
  exit 0
fi

EXT="${FILE##*.}"

case "$EXT" in
  py)
    command -v ruff &>/dev/null && ruff check --fix "$FILE" 2>/dev/null
    ;;
  js|ts|jsx|tsx)
    command -v prettier &>/dev/null && prettier --write "$FILE" 2>/dev/null
    ;;
  json)
    command -v jq &>/dev/null && jq . "$FILE" > "$FILE.tmp" && mv "$FILE.tmp" "$FILE" 2>/dev/null
    ;;
esac

exit 0
