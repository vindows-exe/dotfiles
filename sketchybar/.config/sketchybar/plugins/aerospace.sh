#!/bin/bash

WORKSPACE_ID="${NAME#space.}"

if [ -z "$FOCUSED_WORKSPACE" ]; then
  if command -v aerospace >/dev/null 2>&1; then
    FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused 2>/dev/null)
  fi
fi

if [ "$WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" \
    background.color=0xff957fb8 \
    label.color=0xff1f1f28 \
    icon.color=0xff1f1f28
else
  sketchybar --set "$NAME" \
    background.color=0xff2a2a37 \
    label.color=0xffdcd7ba \
    icon.color=0xffdcd7ba
fi
