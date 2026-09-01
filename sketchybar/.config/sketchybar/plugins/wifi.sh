#!/bin/bash

# Extract SSID reliably on macOS
SSID=$(ipconfig getsummary en0 2>/dev/null | awk -F 'SSID : ' '/ SSID : /{print $2}')

if [ -z "$SSID" ]; then
  SSID=$(ipconfig getsummary en1 2>/dev/null | awk -F 'SSID : ' '/ SSID : /{print $2}')
fi

if [ -z "$SSID" ] || [ "$SSID" = "You are not associated with an AirPort network." ] || [[ "$SSID" =~ "Error" ]] || [[ "$SSID" =~ "error" ]]; then
  sketchybar --set "$NAME" \
    icon="󰖪" \
    icon.color="0xff727169" \
    label="Disconnected" \
    label.drawing=on \
    label.color="0xff727169"
elif [ "$SSID" = "<redacted>" ] || [ "$SSID" = "nil" ]; then
  # Fallback wenn macOS Ortungsdienste den echten Namen sperren
  sketchybar --set "$NAME" \
    icon="󰖩" \
    icon.color="0xff6a9589" \
    label="WLAN" \
    label.drawing=on \
    label.color="0xffdcd7ba"
else
  # Wenn freigegeben: Tatsaechlichen WLAN-Namen anzeigen
  sketchybar --set "$NAME" \
    icon="󰖩" \
    icon.color="0xff6a9589" \
    label="$SSID" \
    label.drawing=on \
    label.color="0xffdcd7ba"
fi
