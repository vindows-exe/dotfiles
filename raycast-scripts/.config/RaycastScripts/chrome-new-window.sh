#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title My First Script
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts

# Der eigentliche Befehl: Sagt macOS, es soll Chrome anweisen, ein neues Fenster zu machen
osascript -e 'tell application "Google Chrome" to make new window'
osascript -e 'tell application "Google Chrome" to activate'

