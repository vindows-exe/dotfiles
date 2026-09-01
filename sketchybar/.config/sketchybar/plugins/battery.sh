#!/bin/bash

BATT_INFO=$(pmset -g batt)
PERCENTAGE=$(echo "$BATT_INFO" | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(echo "$BATT_INFO" | grep -i "charging")

if [ -z "$PERCENTAGE" ]; then
  exit 0
fi

if [ -n "$CHARGING" ]; then
  ICON="󰂄"
  COLOR="0xff98bb6c" # Spring Green
elif [ "$PERCENTAGE" -ge 90 ]; then
  ICON="󰁹"
  COLOR="0xff6a9589" # Wave Aqua 2
elif [ "$PERCENTAGE" -ge 70 ]; then
  ICON="󰂀"
  COLOR="0xff7e9cd8" # Wave Blue
elif [ "$PERCENTAGE" -ge 50 ]; then
  ICON="󰁾"
  COLOR="0xffdcd7ba" # Fuji White
elif [ "$PERCENTAGE" -ge 30 ]; then
  ICON="󰁼"
  COLOR="0xffe6c384" # Boat Yellow
elif [ "$PERCENTAGE" -ge 15 ]; then
  ICON="󰁺"
  COLOR="0xffffa066" # Surimi Orange
else
  ICON="󰂃"
  COLOR="0xffc34043" # Autumn Red
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="${PERCENTAGE}%"
