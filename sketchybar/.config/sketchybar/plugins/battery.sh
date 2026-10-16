#!/bin/bash

BATT_INFO=$(pmset -g batt)
PERCENTAGE=$(echo "$BATT_INFO" | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(echo "$BATT_INFO" | grep -i "charging")

if [ -z "$PERCENTAGE" ]; then
  exit 0
fi

if [ -n "$CHARGING" ]; then
  ICON="󰂄"
  COLOR="0xff87a987" # dragonGreen
elif [ "$PERCENTAGE" -ge 90 ]; then
  ICON="󰁹"
  COLOR="0xff8ea4a2" # dragonAqua
elif [ "$PERCENTAGE" -ge 70 ]; then
  ICON="󰂀"
  COLOR="0xff8ba4b0" # dragonBlue
elif [ "$PERCENTAGE" -ge 50 ]; then
  ICON="󰁾"
  COLOR="0xffc5c9c5" # dragonWhite
elif [ "$PERCENTAGE" -ge 30 ]; then
  ICON="󰁼"
  COLOR="0xffc4b28a" # dragonYellow
elif [ "$PERCENTAGE" -ge 15 ]; then
  ICON="󰁺"
  COLOR="0xffb6927b" # dragonOrange
else
  ICON="󰂃"
  COLOR="0xffc4746e" # dragonRed
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="${PERCENTAGE}%"
