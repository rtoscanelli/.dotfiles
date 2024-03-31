#!/bin/sh

# Power menu script using rofi
POWERMENU_THEME="$HOME/.dotfiles/scripts/powermenu-config.rasi"

CHOSEN=$(printf " Lock\n⏻ Shutdown\n Suspend\n Reboot\n󰗼 Log Out" | rofi -i -dmenu -p "PowerMenu" -config "$POWERMENU_THEME")

case "$CHOSEN" in
	" Lock") betterlockscreen -l ;;
    "⏻ Shutdown") systemctl poweroff ;;
	" Suspend") systemctl suspend  && betterlockscreen -l ;;
	" Reboot") systemctl reboot ;;
	"󰗼 Log Out") i3-msg exit ;;
	*) exit 1 ;;
esac
