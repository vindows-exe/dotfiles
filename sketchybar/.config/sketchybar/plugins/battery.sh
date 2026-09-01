#!/bin/bash

BATT_INFO=$(pmset -g batt)
PERCENTAGE=$(echo "$BATT_INFO" | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(echo "$BATT_INFO" | grep -i "charging")

if [ -z "$PERCENTAGE" ]; then
  exit 0
fi

if [ -n "$CHARGING" ]; then
  ICON="󰂄"
  COLOR="0xffb8bb26" # Green
elif [ "$PERCENTAGE" -ge 90 ]; then
  ICON="󰁹"
  COLOR="0xff8ec07c" # Aqua
elif [ "$PERCENTAGE" -ge 70 ]; then
  ICON="󰂀"
  COLOR="0xffebdbb2" # Foreground
elif [ "$PERCENTAGE" -ge 50 ]; then
  ICON="󰁾"
  COLOR="0xffebdbb2" # Foreground
elif [ "$PERCENTAGE" -ge 30 ]; then
  ICON="󰁼"
  COLOR="0xfffabd2f" # Yellow
elif [ "$PERCENTAGE" -ge 15 ]; then
  ICON="󰁺"
  COLOR="0xfffe8019" # Orange
else
  ICON="󰂃"
  COLOR="0xfffb4934" # Red
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="${PERCENTAGE}%"
