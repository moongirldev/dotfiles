#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar-top.log #/tmp/polybar2.log
echo "---" | tee -a /tmp/polybar-bottom.log #/tmp/polybar2.log
polybar top >>/tmp/polybar-top.log &
polybar bottom >>/tmp/polybar-bottom.log &

echo "Bars launched..."
