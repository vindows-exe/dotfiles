# Dotfiles

Modulare Konfigurationsdateien für macOS und Linux, verwaltet mit GNU Stow.

## Installation

Repository klonen und das Installationsskript ausführen:

```bash
git clone https://github.com/<username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Das Skript `install.sh` prüft die Systemumgebung, installiert erforderliche Pakete via Homebrew (macOS) bzw. Paketmanager (Linux) und verlinkt alle Konfigurationen per Symlink in das Home-Verzeichnis.

## Module

Die Konfigurationen sind in eigenständige GNU Stow-Pakete unterteilt:

| Paket | Tool | Beschreibung |
| :--- | :--- | :--- |
| `aerospace` | AeroSpace | Tiling Window Manager für macOS (Workspaces, Multi-Monitor, App-Routing) |
| `borders` | JankyBorders | Aktive und inaktive Fensterrahmen |
| `sketchybar` | Sketchybar | Statusleiste für macOS (Workspaces, Systemstatus, Musik, VPN) |
| `ghostty` | Ghostty | Terminal-Emulator (Font, Theme, Keybindings) |
| `nvim` | Neovim | LazyVim Setup (Plugins, LSP, Keymaps) |
| `tmux` | Tmux | Terminal-Multiplexer (Prefix `C-a`, Splits, Sessionizer) |
| `zsh` | Zsh | Shell-Konfiguration (Aliase, Environment, Plugins) |
| `starship` | Starship | Prompt-Konfiguration |
| `fastfetch` | Fastfetch | Minimalistisches Systeminfo-Tool |
| `git` | Git | Globale Git-Einstellungen und Ignore-Regeln |
| `yazi` | Yazi | Terminal-Dateimanager |
| `raycast-scripts` | Raycast | Benutzerdefinierte Raycast-Skripte |
| `opencode` | OpenCode | Agenten- und Modelldefinitionen |

## Verzeichnisstruktur

```text
~/dotfiles/
├── aerospace/            # ~/.config/aerospace/
├── borders/              # ~/.config/borders/
├── fastfetch/            # ~/.config/fastfetch/
├── sketchybar/           # ~/.config/sketchybar/
├── ghostty/              # ~/.config/ghostty/
├── git/                  # ~/.gitconfig und ~/.config/git/
├── nvim/                 # ~/.config/nvim/
├── opencode/             # ~/.config/opencode/
├── raycast-scripts/      # ~/.config/RaycastScripts/
├── starship/             # ~/.config/starship.toml
├── tmux/                 # ~/.config/tmux/
├── yazi/                 # ~/.config/yazi/
├── zsh/                  # ~/.zshrc, ~/.zprofile, ~/.zsh/
├── .gitignore
├── install.sh
├── KEYMAPS.md
├── SETUP_GUIDE.md
└── README.md
```

## Verwendung mit GNU Stow

Pakete werden relativ zum Home-Verzeichnis verlinkt:

```bash
# Alle Pakete neu verlinken
cd ~/dotfiles
stow -R -v -t ~ *

# Einzelnes Paket verlinken
stow -R -v -t ~ nvim

# Einzelnes Paket aushängen (Symlinks entfernen)
stow -D -v -t ~ nvim
```

## Secrets und lokale Overrides

Sensible Daten wie SSH-Keys, Cloud-Credentials, API-Tokens, Befehlshistorien und private Git-Konfigurationen (`.gitconfig-local`, `.gitconfig-personal`, `.gitconfig.*`) sind in der `.gitignore` blockiert bzw. liegen außerhalb des Repos direkt in `$HOME`.

- **Umgebungsvariablen & API-Keys:** In `~/.zsh/secrets.zsh` ablegen (wird von `.zshrc` eingebunden).
- **Standard-Git-Identität (Name/E-Mail):** In `~/.gitconfig-local` ablegen (wird unbedingt via `include` in `.gitconfig` eingebunden). So landet die echte Identität nie im Repo.
- **Git SSH-Key-/Identitäts-Switching für GitHub:** In `~/.gitconfig-personal` ablegen (wird via `includeIf` in `.gitconfig` nur für GitHub-Remotes eingebunden).

## Dokumentation

- Eine Übersicht der konfigurierten Tastenkombinationen für Neovim, Tmux und AeroSpace befindet sich in [KEYMAPS.md](KEYMAPS.md).
- Eine ausführliche Einrichtungsanleitung für neue Rechner befindet sich in [SETUP_GUIDE.md](SETUP_GUIDE.md).
