#!/bin/sh

# Power menu script using rofi
POWERMENU_THEME="$HOME/.config/rofi/scripts/powermenu-config.rasi"

CHOSEN=$(printf " Lock\n⏻ Shutdown\n Suspend\n Reboot\n󰗼 Log Out" | rofi -i -dmenu -p "PowerMenu" -config "$POWERMENU_THEME")

case "$CHOSEN" in
	" Lock") swaylock ;;
    "⏻ Shutdown") systemctl poweroff ;;
	" Suspend") swaylock -f && systemctl suspend ;;
	" Reboot") systemctl reboot ;;
	"󰗼 Log Out") hyprctl dispatch exit ;;
	*) exit 1 ;;
esac
