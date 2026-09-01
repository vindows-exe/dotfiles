#!/usr/bin/env bash
# ==============================================================================
# Dotfiles Bootstrap & Installation Script
# Idempotentes Setup für macOS & Linux
# ==============================================================================

set -euo pipefail

# --- Farbdefinitionen ---
BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

log_info()    { printf "${BLUE}==>${NC} ${BOLD}%s${NC}\n" "$1"; }
log_success() { printf "${GREEN}✔${NC} %s\n" "$1"; }
log_warn()    { printf "${YELLOW}▲${NC} %s\n" "$1"; }
log_error()   { printf "${RED}✖${NC} %s\n" "$1"; }

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES_DIR"

log_info "Starte Dotfiles Bootstrap aus: $DOTFILES_DIR"

# ------------------------------------------------------------------------------
# 1. OS & Paketmanager Erkennung
# ------------------------------------------------------------------------------
OS="$(uname -s)"
case "$OS" in
    Darwin)
        log_info "Betriebssystem erkannt: macOS (Darwin)"
        
        # Homebrew prüfen/installieren
        if ! command -v brew >/dev/null 2>&1; then
            log_warn "Homebrew nicht gefunden. Installiere Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            
            if [[ -d "/opt/homebrew/bin" ]]; then
                eval "$(/opt/homebrew/bin/brew shellenv)"
            elif [[ -d "/usr/local/bin" ]]; then
                eval "$(/usr/local/bin/brew shellenv)"
            fi
        fi

        log_info "Installiere essenzielle Homebrew-Pakete..."
        BREW_FORMULAE=(
            git
            stow
            neovim
            tmux
            fzf
            ripgrep
            eza
            bat
            starship
            yazi
            zsh-autosuggestions
            zsh-syntax-highlighting
            fnm
            felixkratz/formulae/borders
            felixkratz/formulae/sketchybar
        )

        for formula in "${BREW_FORMULAE[@]}"; do
            formula_name="$(basename "$formula")"
            if brew list "$formula_name" >/dev/null 2>&1 || brew list "$formula" >/dev/null 2>&1; then
                log_success "Bereits installiert: $formula"
            else
                log_info "Installiere $formula..."
                brew install "$formula"
            fi
        done
        ;;

    Linux)
        log_info "Betriebssystem erkannt: Linux"
        
        if command -v apt-get >/dev/null 2>&1; then
            log_info "Nutze APT (Debian/Ubuntu)..."
            sudo apt-get update -y
            sudo apt-get install -y git stow neovim tmux fzf ripgrep zsh curl
        elif command -v pacman >/dev/null 2>&1; then
            log_info "Nutze Pacman (Arch Linux)..."
            sudo pacman -Syu --noconfirm git stow neovim tmux fzf ripgrep zsh
        elif command -v dnf >/dev/null 2>&1; then
            log_info "Nutze DNF (Fedora/RHEL)..."
            sudo dnf install -y git stow neovim tmux fzf ripgrep zsh
        else
            log_warn "Kein bekannter Paketmanager gefunden. Bitte installiere git, stow, neovim, tmux manuell."
        fi
        ;;

    *)
        log_error "Nicht unterstütztes Betriebssystem: $OS"
        exit 1
        ;;
esac

# ------------------------------------------------------------------------------
# 2. Berechtigungen für Skripte sicherstellen
# ------------------------------------------------------------------------------
log_info "Setze Ausführungsrechte für Skripte..."
[[ -f "$DOTFILES_DIR/tmux/.config/tmux/tmux-sessionizer" ]] && chmod +x "$DOTFILES_DIR/tmux/.config/tmux/tmux-sessionizer"
[[ -f "$DOTFILES_DIR/raycast-scripts/.config/RaycastScripts/chrome-new-window.sh" ]] && chmod +x "$DOTFILES_DIR/raycast-scripts/.config/RaycastScripts/chrome-new-window.sh"
[[ -f "$DOTFILES_DIR/borders/.config/borders/bordersrc" ]] && chmod +x "$DOTFILES_DIR/borders/.config/borders/bordersrc"
[[ -f "$DOTFILES_DIR/sketchybar/.config/sketchybar/sketchybarrc" ]] && chmod +x "$DOTFILES_DIR/sketchybar/.config/sketchybar/sketchybarrc"
[[ -f "$DOTFILES_DIR/sketchybar/.config/sketchybar/colors.sh" ]] && chmod +x "$DOTFILES_DIR/sketchybar/.config/sketchybar/colors.sh"
if [[ -d "$DOTFILES_DIR/sketchybar/.config/sketchybar/plugins" ]]; then
    chmod +x "$DOTFILES_DIR/sketchybar/.config/sketchybar/plugins/"*.sh 2>/dev/null || true
fi

# ------------------------------------------------------------------------------
# 3. GNU Stow Pakete anwenden
# ------------------------------------------------------------------------------
log_info "Verlinke Konfigurationen via GNU Stow..."

# Zielverzeichnisse anlegen, falls noch nicht vorhanden
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.zsh"

ALL_PACKAGES=(
    git
    zsh
    starship
    tmux
    nvim
    yazi
    opencode
)

# macOS-spezifische Pakete hinzufügen
if [[ "$OS" == "Darwin" ]]; then
    ALL_PACKAGES+=(
        aerospace
        borders
        sketchybar
        ghostty
        karabiner
        raycast-scripts
    )
fi

for pkg in "${ALL_PACKAGES[@]}"; do
    if [[ -d "$DOTFILES_DIR/$pkg" ]]; then
        log_info "Stowe Paket: $pkg"
        # -R = Restow (Prunt alte Links und verlinkt neu), -t = Target
        stow -R -v -d "$DOTFILES_DIR" -t "$HOME" "$pkg"
        log_success "Paket '$pkg' erfolgreich verlinkt."
    else
        log_warn "Paket '$pkg' existiert nicht im Dotfiles-Verzeichnis, überspringe."
    fi
done

# ------------------------------------------------------------------------------
# 4. Abschlussmeldung & Hinweise
# ------------------------------------------------------------------------------
printf "\n${GREEN}${BOLD}=====================================================${NC}\n"
printf "${GREEN}${BOLD}   Dotfiles erfolgreich installiert und verlinkt!   ${NC}\n"
printf "${GREEN}${BOLD}=====================================================${NC}\n\n"

log_info "Nächste optionale Schritte:"
echo "  1. Starte deine Shell neu:        exec zsh"
echo "  2. Öffne Neovim für Plugin-Sync:  nvim"
echo "  3. Services starten (macOS):      brew services start borders && brew services start sketchybar"
echo "  4. Schriftart prüfen:             JetBrainsMono Nerd Font installieren"
echo "  5. Lokale Secrets einrichten:     ~/.zsh/secrets.zsh (wird nicht getrackt)"
echo ""
