#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config
polybar thelio 2>&1 | tee -a /tmp/polybarmain.log & disown

echo "Polybar launched..."
