#!/bin/zsh

# Directories to search
search_directories=("$HOME/ist" "$HOME/projects" "$HOME/.dotfiles")

selected_folder=$(find "${search_directories[@]}" -type d | fzf)

if [ -n "$selected_folder" ]; then
    folder_name=$(basename "$selected_folder")

    if [ -n "$TMUX" ]; then
        tmux new-window -c "$selected_folder" -n "$folder_name"
    fi

    tmux new-session -c "$selected_folder" -s "$folder_name"
fi
