#! /bin/sh

# Clean Polybars
killall -q polybar

# Launch Polybars
polybar plunne-top &
polybar plunne2-top &
sleep 0.2;
polybar plunne-dock &
polybar plunne2-dock &
