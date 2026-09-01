#!/bin/bash

WORKSPACE_ID="${NAME#space.}"

if [ -z "$FOCUSED_WORKSPACE" ]; then
  if command -v aerospace >/dev/null 2>&1; then
    FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused 2>/dev/null)
  fi
fi

if [ "$WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" \
    background.color=0xfffe8019 \
    label.color=0xff282828 \
    icon.color=0xff282828
else
  sketchybar --set "$NAME" \
    background.color=0xff3c3836 \
    label.color=0xffebdbb2 \
    icon.color=0xffebdbb2
fi
