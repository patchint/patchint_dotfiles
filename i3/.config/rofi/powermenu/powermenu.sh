#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#

rofi_command="rofi -theme $HOME/.config/rofi/powermenu/powermenu"

##################
#     Uptime     #
##################

uptime=$(uptime -p | sed -e 's/up //g')

###################
#     Options     #
###################

shutdown=""
reboot=""
lock=""
suspend=""
logout=""

options="$shutdown\n$reboot\n$suspend\n$logout"

##################
#     Select     #
##################

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"

case $chosen in
    # Power off
    $shutdown)  systemctl poweroff;;
    # Reboot
    $reboot)	systemctl reboot;;
    # Suspend
    $suspend)   systemctl suspend;;
    # Logout
    $logout)    bspc quit;;
esac
