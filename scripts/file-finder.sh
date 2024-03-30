#!/bin/bash

# Search for files on the system and pass the result to fzf
FILENAME=$(find ~ -type f -printf "%f\n" | rofi -i -dmenu -p "Find:")

FILE=$(find ~ -type f | fzf --query="'$FILENAME" --select-1 --exit-0)

# Open the selected file using xdg-open
if [ -n "$FILE" ]; then
    xdg-open "$FILE"
fi

