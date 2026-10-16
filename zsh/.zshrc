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

# --- ANSI / Kanagawa Dragon für 'bat' ---
export BAT_THEME="ansi"

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

# Farbe der Vorschläge & FZF an Kanagawa Dragon anpassen
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#737c73'
FZF_DEFAULT_OPTS="--color=bg+:#282727,bg:#181616,spinner:#87a987,hl:#87a987,fg:#c5c9c5,header:#87a987,info:#8ea4a2,pointer:#87a987,marker:#8a9a7b,fg+:#c5c9c5,prompt:#8ba4b0,hl+:#87a987,border:#625e5a"

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

# --- Fastfetch beim interaktiven Start ---
if [[ -o interactive ]] && command -v fastfetch >/dev/null 2>&1; then
  fastfetch
fi
