#!/bin/bash

choice=$(printf "󰌾 Lock\n󰗽 Logout\n Reboot\n󰐥 Shutdown" | fuzzel --dmenu --width=40 --line-height=28 --lines=5)

case "$choice" in
  *Lock)
    swaylock
    ;;
  *Logout)
    swaymsg exit
    ;;
  *Reboot)
    systemctl reboot
    ;;
  *Shutdown)
    systemctl poweroff
    ;;
esac
