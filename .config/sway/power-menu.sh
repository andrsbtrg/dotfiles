#!/bin/bash

choice=$(printf "Lock\nLogout\nReboot\nShutdown" | fuzzel --dmenu)

case "$choice" in
  Lock)
    swaylock
    ;;
  Logout)
    swaymsg exit
    ;;
  Reboot)
    systemctl reboot
    ;;
  Shutdown)
    systemctl poweroff
    ;;
esac
