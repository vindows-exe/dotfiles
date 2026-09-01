# ⚡️ Modular Dotfiles

> **A modern, keyboard-centric, and reproducible terminal development environment powered by GNU Stow.**  
> Crafted with a unified **Gruvbox Dark** aesthetic, seamless **Neovim & Tmux** navigation, **AeroSpace** tiling window management, **Sketchybar**, and **JankyBorders**.

---

## 🚀 Quickstart (One-Liner)

Um dieses Setup auf einem frischen Rechner (macOS / Linux) in einem Schritt zu klonen und vollständig einzurichten:

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./install.sh
```

---

## 🧰 Enthaltene Tools & Module

Jedes Tool ist als eigenständiges, isoliertes **GNU Stow Paket** organisiert:

| Paket | Tool | Zweck & Highlights |
| :--- | :--- | :--- |
| **`aerospace`** | [AeroSpace](https://github.com/nikitabobko/AeroSpace) | Tiling Window Manager für macOS mit i3-artigen Keybindings (`Cmd+Alt+h/j/k/l`) & Workspace-Routing. |
| **`borders`** | [JankyBorders](https://github.com/FelixKratz/JankyBorders) | Animierte, abgerundete Fensterrahmen im Gruvbox-Orange-Look (`0xfffe8019`). |
| **`sketchybar`** | [Sketchybar](https://github.com/FelixKratz/Sketchybar) | Hochgradig anpassbare macOS-Statusleiste mit AeroSpace-Workspaces, Akku, WLAN, Uhr & Gruvbox-Farben. |
| **`ghostty`** | [Ghostty](https://ghostty.org/) | GPU-beschleunigter Terminal-Emulator mit JetBrainsMono Nerd Font & `gruvbox-dark-hard` Palette. |
| **`nvim`** | [Neovim](https://neovim.io/) / [LazyVim](https://www.lazyvim.org/) | Modulares Lua-Setup mit Gruvbox-Theme, Snacks, Harpoon & nativer Tmux-Navigation. |
| **`tmux`** | [Tmux](https://github.com/tmux/tmux) | Terminal-Multiplexer mit TrueColor, `C-a` Prefix, intuitivem Split-Layout und `tmux-sessionizer`. |
| **`zsh`** | [Zsh](https://www.zsh.org/) | Optimierte Shell mit `starship`, `fnm`, `fzf`, `eza`-Aliases, Autosuggestions & Syntax-Highlighting. |
| **`starship`** | [Starship Prompt](https://starship.rs/) | Minimalistischer, ultraschneller Cross-Shell-Prompt im Gruvbox-Farbschema mit Git-Statusanzeige. |
| **`git`** | [Git](https://git-scm.com/) | Globale Git-Konfiguration mit `nvim` als Editor und systemweiter `.gitignore`. |
| **`yazi`** | [Yazi](https://github.com/sxyazi/yazi) | Asynchroner Terminal-Dateimanager mit Bildvorschau (`lanczos3`) & Zsh `y`-Wrapper für Verzeichniswechsel. |
| **`karabiner`** | [Karabiner-Elements](https://karabiner-elements.pqrs.org/) | Systemweites macOS-Tastaturmapping (`Caps-Lock` als Hyper-Modifier). |
| **`raycast-scripts`**| [Raycast Scripts](https://www.raycast.com/) | Eigene macOS-Automatisierungsskripte für den Raycast-Launcher (z. B. `chrome-new-window.sh`). |
| **`opencode`** | [OpenCode AI](https://opencode.ai/) | Konfiguration und System-Prompts für lokale KI-Entwicklungsagenten (`coder`, `architect`, `reviewer`). |

---

## 📂 Repository-Struktur

```text
~/dotfiles/
├── aerospace/            # AeroSpace Tiling Window Manager
│   └── .config/aerospace/aerospace.toml
├── borders/              # JankyBorders Fensterrahmen
│   └── .config/borders/bordersrc
├── sketchybar/           # Sketchybar Statusleiste & Plugins
│   └── .config/sketchybar/
│       ├── sketchybarrc
│       ├── colors.sh
│       └── plugins/
├── ghostty/              # Ghostty GPU Terminal & Custom Themes
│   └── .config/ghostty/
│       ├── config
│       └── themes/gruvbox-dark-hard
├── git/                  # Globale Git Config & Ignore
│   ├── .gitconfig
│   └── .config/git/ignore
├── karabiner/            # Karabiner Tastatur-Remappings
│   └── .config/karabiner/karabiner.json
├── nvim/                 # LazyVim / Neovim IDE Config
│   └── .config/nvim/
│       ├── init.lua
│       ├── lazy-lock.json
│       ├── lazyvim.json
│       ├── stylua.toml
│       └── lua/
├── opencode/             # KI-Agenten & Prompts
│   └── .config/opencode/
├── raycast-scripts/      # Raycast Script Commands
│   └── .config/RaycastScripts/
├── starship/             # Starship Cross-Shell Prompt
│   └── .config/starship.toml
├── tmux/                 # Tmux Config & Sessionizer
│   └── .config/tmux/
│       ├── tmux.conf
│       └── tmux-sessionizer
├── yazi/                 # Yazi Terminal File Manager
│   └── .config/yazi/yazi.toml
├── zsh/                  # Zsh Config, Profile & Completions
│   ├── .zprofile
│   ├── .zshrc
│   └── .zsh/ng_completion.zsh
├── .gitignore            # Strikter Filter für Secrets, Keys & State
├── install.sh            # Idempotentes Bootstrap- & Verlinkungsskript
├── KEYMAPS.md            # Workflow Cheat Sheet & Shortcut-Übersicht
├── SETUP_GUIDE.md        # Vollständige Installations- und Setup-Anleitung
└── README.md             # Projekt-Showcase
```

---

## 🔧 GNU Stow Bedienung

GNU Stow spiegelt die Verzeichnisstruktur der Pakete nahtlos in dein `$HOME`-Verzeichnis per Symlink.

### Alle Pakete verlinken:
```bash
cd ~/dotfiles
stow -R -v -t ~ *
# Oder nutze das Bootstrap-Skript:
./install.sh
```

### Einzelnes Paket hinzufügen oder neu verlinken:
```bash
cd ~/dotfiles
stow -R -v -t ~ nvim
```

### Paket aushängen (Symlinks entfernen):
```bash
cd ~/dotfiles
stow -D -v -t ~ <paketname>
```

---

## 🔒 Sicherheit & Secrets-Management

- Sensible Dateien, SSH-Keys (`~/.ssh`), Cloud-Credentials (`~/.config/gcloud`), GPG-Schlüssel, Shell-Historien und API-Tokens sind über eine strikte [`.gitignore`](.gitignore) kategorisch ausgeschlossen.
- **Private Umgebungsvariablen:** Lege lokale API-Keys oder Zugangsdaten in `~/.zsh/secrets.zsh` ab. Diese Datei wird automatisch von der Zsh geladen, verbleibt jedoch ausschließlich lokal auf deiner Maschine und wird niemals in Git committet.

---

## ⌨️ Tastaturkürzel & Cheat Sheet

Eine detaillierte Referenz aller Shortcuts für Neovim, Tmux und AeroSpace findest du in der Datei [`KEYMAPS.md`](KEYMAPS.md).
