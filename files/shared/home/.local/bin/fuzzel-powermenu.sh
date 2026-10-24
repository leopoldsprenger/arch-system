#!/bin/bash

SELECTION="$(printf "Lock\nSuspend\nLog out\nReboot\nShutdown" | fuzzel --dmenu -l 5 -p "Power Menu: ")"

case $SELECTION in
	*"Lock")
		swaylock --config ~/.config/swaylock/config --config ~/.config/swaylock/colors;;
	*"Suspend")
		systemctl suspend;;
	*"Log out")
		swaymsg exit;;
	*"Reboot")
		systemctl reboot;;
	*"Shutdown")
		systemctl poweroff;;
esac
