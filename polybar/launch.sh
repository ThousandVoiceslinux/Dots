#!/usr/bin/env bash

# kill all polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

#launch bar's
# DP-2
polybar example &

# HDMI-0
polybar example_2 &

echo "Bar launched"

