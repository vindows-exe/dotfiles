autoload -Uz compinit
compinit -C

# --- Brew Prefix (einmal cachen, kein Subprozess) ---
if [[ -d "/opt/homebrew" ]]; then
  BREW_PREFIX="/opt/homebrew"
else
  BREW_PREFIX="/usr/local"
fi

# --- Power Init ---
eval "$(starship init zsh)"
eval "$(fnm env)"
eval "$(fzf --zsh)"

# --- Gruvbox für 'bat' ---
export BAT_THEME="Gruvbox-Dark"

# --- Aliases ---
alias ls="eza --icons"
alias ll="eza -la --icons --git --no-user --time-style=relative"
alias vim="nvim"
alias g="lazygit"
alias ..="cd .."
alias ts=~/.config/tmux/tmux-sessionizer

# NVIM als Default setzen
export EDITOR='nvim'
export VISUAL='nvim'

# Yazi Wrapper (bleibt im Ordner beim Beenden)
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# --- Zsh Plugins (Vorschläge & Highlighting) ---
source "${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Farbe der Vorschläge an Kanagawa anpassen
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#727169'
FZF_DEFAULT_OPTS="--color=bg+:#2a2a37,bg:#1f1f28,spinner:#957fb8,hl:#957fb8,fg:#dcd7ba,header:#957fb8,info:#6a9589,pointer:#957fb8,marker:#98bb6c,fg+:#dcd7ba,prompt:#7e9cd8,hl+:#957fb8"

# Angular CLI autocompletion (pre-generated, einmalig mit: ng completion script > ~/.zsh/ng_completion.zsh)
[[ -f ~/.zsh/ng_completion.zsh ]] && source ~/.zsh/ng_completion.zsh

# --- API Keys (ausgelagert, nicht in git tracken) ---
[[ -f ~/.zsh/secrets.zsh ]] && source ~/.zsh/secrets.zsh

# --- pyenv (Lazy Load) ---
# Shims sofort in PATH → python/pip funktionieren direkt
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"

# Vollständiges Init (incl. virtualenv-auto-activation) erst beim ersten pyenv-Aufruf
pyenv() {
  unfunction pyenv
  eval "$(command pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  pyenv "$@"
}

# --- SDKMAN (Lazy Load) ---
# sdk-Befehle stehen erst nach dem ersten Aufruf zur Verfügung
sdk() {
  unfunction sdk
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
  sdk "$@"
}

_ZO_DOCTOR=0
eval "$(zoxide init zsh --cmd cd)"
