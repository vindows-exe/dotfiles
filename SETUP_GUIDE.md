# Laptop Setup & Installationsanleitung

Dokumentation der installierten Software und Anleitung zur Einrichtung eines neuen Rechners unter macOS oder Linux.

---

## 1. Übersicht der Tools und Pakete

### Window Management und GUI-Anwendungen (macOS)
| Tool | Funktion | Installationsbefehl |
| :--- | :--- | :--- |
| **AeroSpace** | Tiling Window Manager für macOS | `brew install --cask nikitabobko/tap/aerospace` |
| **Sketchybar** | Statusleiste für macOS | `brew install felixkratz/formulae/sketchybar` |
| **JankyBorders** | Fensterrahmen-Hervorhebung | `brew install felixkratz/formulae/borders` |
| **Karabiner-Elements** | Tastatur-Remapping (Caps-Lock) | `brew install --cask karabiner-elements` |
| **Ghostty** | GPU-beschleunigter Terminal-Emulator | `brew install --cask ghostty` |
| **Raycast** | Anwendungs- und Skript-Launcher | `brew install --cask raycast` |

### CLI-Werkzeuge
| Tool | Funktion | Installationsbefehl |
| :--- | :--- | :--- |
| **Neovim** | LazyVim Editor-Setup | `brew install neovim` |
| **Tmux** | Terminal-Multiplexer | `brew install tmux` |
| **GNU Stow** | Symlink-Manager für Dotfiles | `brew install stow` |
| **Starship** | Shell-Prompt | `brew install starship` |
| **Yazi** | Terminal-Dateimanager | `brew install yazi` |
| **fzf** | Fuzzy-Finder | `brew install fzf` |
| **ripgrep** | Dateisuche (`rg`) | `brew install ripgrep` |
| **eza** | Dateilisten (`ls`-Alternative) | `brew install eza` |
| **bat** | Datei-Betrachter mit Syntax-Highlighting | `brew install bat` |
| **fnm** | Fast Node Manager | `brew install fnm` |
| **Zsh-Plugins** | Autosuggestions & Syntax Highlighting | `brew install zsh-autosuggestions zsh-syntax-highlighting` |

### Schriftart
- **JetBrainsMono Nerd Font**: Notwendig für Symbole und Terminaldarstellung.
  ```bash
  brew install --cask font-jetbrains-mono-nerd-font
  ```

---

## 2. Dotfiles-Pakete

| Stow-Paket | Zielpfad | Funktion |
| :--- | :--- | :--- |
| `aerospace` | `~/.config/aerospace/aerospace.toml` | Keybindings und Workspace-Routing |
| `borders` | `~/.config/borders/bordersrc` | Rahmenbreite und Farben |
| `sketchybar` | `~/.config/sketchybar/` | Statusleiste und Skripte |
| `ghostty` | `~/.config/ghostty/` | Terminalkonfiguration und Themes |
| `git` | `~/.gitconfig`, `~/.config/git/ignore` | Benutzerdaten und globale Ignore-Regeln |
| `karabiner` | `~/.config/karabiner/karabiner.json` | Caps-Lock als Modifier |
| `nvim` | `~/.config/nvim/` | LazyVim Setup |
| `opencode` | `~/.config/opencode/` | Agenten-Prompts |
| `raycast-scripts` | `~/.config/RaycastScripts/` | Benutzerdefinierte Skripte |
| `starship` | `~/.config/starship.toml` | Prompt-Layout |
| `tmux` | `~/.config/tmux/` | `tmux.conf` und `tmux-sessionizer` |
| `yazi` | `~/.config/yazi/yazi.toml` | Dateimanager-Konfiguration |
| `zsh` | `~/.zshrc`, `~/.zprofile`, `~/.zsh/` | Shell-Konfiguration |

---

## 3. Installation auf einem neuen Rechner

### Schritt 1: Xcode Command Line Tools (macOS)
```bash
xcode-select --install
```

### Schritt 2: SSH-Schlüssel für GitHub einrichten
```bash
ssh-keygen -t ed25519 -C "name@domain.com"
cat ~/.ssh/id_ed25519.pub
```
Den Schlüssel unter https://github.com/settings/keys hinterlegen.

### Schritt 3: Repository klonen und Bootstrap ausführen
```bash
git clone git@github.com:<username>/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./install.sh
```

### Schritt 4: GUI-Programme und Schriftart installieren (macOS)
```bash
brew install --cask \
  font-jetbrains-mono-nerd-font \
  ghostty \
  raycast \
  karabiner-elements \
  nikitabobko/tap/aerospace
```

### Schritt 5: Hintergrunddienste starten (macOS)
```bash
brew services start felixkratz/formulae/borders
brew services start felixkratz/formulae/sketchybar
```

### Schritt 6: Systemberechtigungen vergeben (macOS)
1. **Bedienungshilfen (Accessibility):** `AeroSpace` und `Karabiner-Elements` aktivieren.
2. **Eingabeüberwachung (Input Monitoring):** `Karabiner-Elements` aktivieren.
3. **Raycast:** Unter *Settings -> Extensions -> Script Commands* das Verzeichnis `~/.config/RaycastScripts` hinzufügen.

### Schritt 7: Shell initialisieren
```bash
exec zsh
```
Neovim einmalig starten, um Lazy.nvim-Plugins zu synchronisieren:
```bash
nvim
```

---

## 4. Wartung und Synchronisation

### Änderungen committen und pushen:
```bash
cd ~/dotfiles
git status
git add .
git commit -m "chore: update config"
git push
```

### Änderungen auf anderen Rechnern aktualisieren:
```bash
cd ~/dotfiles
git pull
./install.sh
```
