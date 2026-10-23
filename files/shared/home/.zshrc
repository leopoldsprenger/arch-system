# Avoid the Zsh first-run configuration wizard
zsh-newuser-install() { :; }

# Completion directories (Arch Linux)
fpath=(/usr/share/zsh/site-functions $fpath)

# Initialize completion
autoload -Uz compinit
compinit

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# fzf-tab — searchable Tab completion
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh

# fzf-tab appearance and behavior
zstyle ':fzf-tab:*' fzf-flags --height=60% --layout=reverse

# Directory previews for cd and zoxide
zstyle ':fzf-tab:complete:(cd|__zoxide_z):*' \
    fzf-preview 'eza --color=always --icons --tree --level=2 $realpath'

# fzf shell integration (Ctrl+R, Ctrl+T, Alt+C)
source <(fzf --zsh)

# Add personal executables to PATH
path=("$HOME/.local/bin" "$HOME/bin" $path)

# Python
export UV_PYTHON_PREFERENCE=only-system

# Plugins installed by pacman
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#909090'
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# Aliases
alias ls='eza --icons=auto --group-directories-first'
alias ll='eza -lah --icons=auto --group-directories-first'
alias cat='bat'
alias vim='nvim'
alias vi='nvim'
alias arch='archivist'

# tmux
tmux() {
  if [[ "$1" == "attach" || "$1" == "a" || "$1" == "at" || "$1" == "attach-session" ]]; then
    shift
    command tmux new-session -A -s main "$@"
  else
    command tmux "$@"
  fi
}

# ssh
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Bat
export BAT_THEME=ansi

# Zoxide replaces cd
eval "$(zoxide init zsh --cmd cd)"

# Starship — Matugen-generated theme
export STARSHIP_CACHE="$HOME/.cache/starship"
export STARSHIP_CONFIG="$HOME/.config/matugen/generated/starship.toml"
eval "$(starship init zsh)"
