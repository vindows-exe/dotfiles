#!/bin/bash

if ! command -v nowplaying-cli >/dev/null 2>&1; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

PLAYBACK_RATE=$(nowplaying-cli get playbackRate 2>/dev/null)

# Hide if paused or stopped
if [ "$PLAYBACK_RATE" != "1" ]; then
  sketchybar --set music drawing=off
  exit 0
fi

TITLE=$(nowplaying-cli get title 2>/dev/null)
ARTIST=$(nowplaying-cli get artist 2>/dev/null)

if [ -z "$TITLE" ] || [ "$TITLE" = "null" ]; then
  sketchybar --set music drawing=off
  exit 0
fi

if [ -n "$ARTIST" ] && [ "$ARTIST" != "null" ]; then
  BAR_LABEL="${ARTIST} - ${TITLE}"
else
  BAR_LABEL="${TITLE}"
fi

# Bar Label auf 25 Zeichen kürzen
if [ ${#BAR_LABEL} -gt 28 ]; then
  BAR_LABEL="$(echo "$BAR_LABEL" | cut -c 1-25)..."
fi

sketchybar --set music drawing=on label="$BAR_LABEL"
