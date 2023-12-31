# Created by newuser for 5.8.
HISTSIZE=1000
SAVEHIST=1000  # Save most-recent 1000 lines
export HISTFILE=~/.zsh_history

# Starship shell prompt.
eval "$(starship init zsh)"

# Set an alias for ls to use color by default
alias ls='ls --color=auto'

# Add directories to your PATH
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin"

# Set your editor (change to your preferred editor)
export EDITOR="nvim"

# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Make zsh accept a suggestion with TAB
bindkey "\t" menu-complete

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

