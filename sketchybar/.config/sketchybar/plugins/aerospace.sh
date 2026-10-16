#!/bin/bash

WORKSPACE_ID="${NAME#space.}"

if [ -z "$FOCUSED_WORKSPACE" ]; then
  if command -v aerospace >/dev/null 2>&1; then
    FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused 2>/dev/null)
  fi
fi

if [ "$WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" \
    background.color=0xff87a987 \
    label.color=0xff181616 \
    icon.color=0xff181616
else
  sketchybar --set "$NAME" \
    background.color=0xff282727 \
    label.color=0xffc5c9c5 \
    icon.color=0xffc5c9c5
fi
