# Config file inspired in 'Dreams of Autonomy - zsh' yt video

# Configure Zinit - the plugin manager for zsh
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Add plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab # FZF tab completion

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q # usefull for zinit

# Keybinds
bindkey '^l' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# History
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # to make completion case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # to colorize completions
zstyle ':completion:*' menu no # to disable default menu for fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # to preview directories with ls
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath' # to preview directories with ls + zoxide

# Shell integrations
source /usr/share/fzf/shell/key-bindings.zsh # fzf keybindings
eval "$(zoxide init --cmd cd zsh)" # zoxide shell integration
