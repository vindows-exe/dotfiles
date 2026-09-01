#!/bin/bash

TITLE=""
if command -v aerospace >/dev/null 2>&1; then
  TITLE=$(aerospace list-windows --focused --format "%{app-name}: %{window-title}" 2>/dev/null)
  if [ -z "$TITLE" ]; then
    TITLE=$(aerospace list-windows --focused --format "%{app-name}" 2>/dev/null)
  fi
fi

if [ -z "$TITLE" ]; then
  TITLE="$INFO"
fi

if [ -z "$TITLE" ]; then
  TITLE="Desktop"
fi

# Max 30 chars
if [ ${#TITLE} -gt 30 ]; then
  TITLE="$(echo "$TITLE" | cut -c 1-27)..."
fi

sketchybar --set "$NAME" label="$TITLE"
