# Avoid the Zsh first-run configuration wizard
zsh-newuser-install() { :; }

# Completion
autoload -Uz compinit
compinit

# Plugins installed by pacman
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add personal executables to PATH
path=("$HOME/.local/bin" "$HOME/bin" $path)

# Python
export UV_PYTHON_PREFERENCE=only-system

# History
HISTSIZE=5000
SAVEHIST=5000
HISTFILE="$HOME/.zsh_history"

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Emacs-style keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no

# Aliases
alias ls='eza --icons=auto --group-directories-first'
alias ll='eza -lah --icons=auto --group-directories-first'
alias cat='bat'

# Bat
export BAT_THEME=ansi

# Zoxide
eval "$(zoxide init zsh)"

# fzf keybindings and completion
source <(fzf --zsh)

# fzf-tab plugin
if [[ -f /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh ]]; then
    source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
fi

zstyle ':fzf-tab:complete:(cd|__zoxide_z):*' \
    fzf-preview 'eza --icons --tree --level=2 $realpath'

# Starship — Matugen-generated theme
export STARSHIP_CACHE="$HOME/.cache/starship"
export STARSHIP_CONFIG="$HOME/.config/matugen/generated/starship.toml"
eval "$(starship init zsh)"
