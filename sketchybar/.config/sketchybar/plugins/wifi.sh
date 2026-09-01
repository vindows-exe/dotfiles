#!/bin/bash

# Extract SSID reliably on macOS Sonoma/Sequoia/Tahoe
SSID=$(ipconfig getsummary en0 2>/dev/null | awk -F 'SSID : ' '/ SSID : /{print $2}')

if [ -z "$SSID" ]; then
  SSID=$(ipconfig getsummary en1 2>/dev/null | awk -F 'SSID : ' '/ SSID : /{print $2}')
fi

if [ -z "$SSID" ] || [ "$SSID" = "You are not associated with an AirPort network." ] || [[ "$SSID" =~ "Error" ]] || [[ "$SSID" =~ "error" ]]; then
  sketchybar --set "$NAME" icon="󰖪" label="Disconnected" icon.color="0xff928374"
else
  # Truncate long SSIDs if needed
  if [ ${#SSID} -gt 16 ]; then
    SSID="$(echo "$SSID" | cut -c 1-13)..."
  fi
  sketchybar --set "$NAME" icon="󰖩" label="$SSID" icon.color="0xff8ec07c"
fi
