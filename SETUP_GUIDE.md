# Laptop Setup & Installationsanleitung

Dokumentation der installierten Software und Anleitung zur Einrichtung eines neuen Rechners unter macOS oder Linux.

---

## 1. Übersicht der Tools und Pakete

### Window Management und GUI-Anwendungen (macOS)
| Tool | Funktion | Installationsbefehl |
| :--- | :--- | :--- |
| **AeroSpace** | Tiling Window Manager für macOS | `brew install --cask nikitabobko/tap/aerospace` |
| **Sketchybar** | Statusleiste für macOS (Workspaces, System, Musik, VPN) | `brew install felixkratz/formulae/sketchybar` |
| **JankyBorders** | Fensterrahmen-Hervorhebung | `brew install felixkratz/formulae/borders` |
| **Karabiner-Elements** | Tastatur-Remapping (Caps-Lock als Hyper-Key) | `brew install --cask karabiner-elements` |
| **Ghostty** | GPU-beschleunigter Terminal-Emulator | `brew install --cask ghostty` |
| **Raycast** | Anwendungs- und Skript-Launcher | `brew install --cask raycast` |
| **Scroll Reverser** | Unabhängiges Scrollen für Trackpad und Maus | `brew install --cask scroll-reverser` |
| **Vorssaint** | Gebetszeiten-Menüleisten-App | `brew install --cask vorssaint` |

### CLI-Werkzeuge
| Tool | Funktion | Installationsbefehl |
| :--- | :--- | :--- |
| **Neovim** | LazyVim Editor-Setup | `brew install neovim` |
| **Tmux** | Terminal-Multiplexer | `brew install tmux` |
| **GNU Stow** | Symlink-Manager für Dotfiles | `brew install stow` |
| **Starship** | Shell-Prompt | `brew install starship` |
| **Fastfetch** | Minimalistisches Systeminfo-Tool | `brew install fastfetch` |
| **Yazi** | Terminal-Dateimanager | `brew install yazi` |
| **lazygit** | Terminal-UI für Git | `brew install lazygit` |
| **nowplaying-cli** | CLI für macOS Mediensteuerung (Sketchybar) | `brew install nowplaying-cli` |
| **fzf** | Fuzzy-Finder | `brew install fzf` |
| **ripgrep** | Dateisuche (`rg`) | `brew install ripgrep` |
| **fd** | Schneller `find`-Ersatz | `brew install fd` |
| **eza** | Dateilisten (`ls`-Alternative) | `brew install eza` |
| **bat** | Datei-Betrachter mit Syntax-Highlighting | `brew install bat` |
| **zoxide** | Intelligenter Verzeichnis-Springer (`cd`-Alternative) | `brew install zoxide` |
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
| `aerospace` | `~/.config/aerospace/aerospace.toml` | Keybindings, Multi-Monitor-Gaps und Workspace-Routing |
| `borders` | `~/.config/borders/bordersrc` | Rahmenbreite und Farben (Gruvbox-Orange) |
| `sketchybar` | `~/.config/sketchybar/` | Statusleiste, AeroSpace-Workspaces, Music/VPN-Pillen |
| `ghostty` | `~/.config/ghostty/` | Terminalkonfiguration und Themes |
| `git` | `~/.gitconfig`, `~/.config/git/ignore` | Globale Git-Einstellungen und Ignore-Regeln |
| `karabiner` | `~/.config/karabiner/karabiner.json` | Caps-Lock als Modifier |
| `nvim` | `~/.config/nvim/` | LazyVim Setup |
| `opencode` | `~/.config/opencode/` | Agenten-Prompts |
| `raycast-scripts` | `~/.config/RaycastScripts/` | Benutzerdefinierte Skripte |
| `starship` | `~/.config/starship.toml` | Prompt-Layout |
| `fastfetch` | `~/.config/fastfetch/config.jsonc` | Minimalistisches Systeminfo-Layout |
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
  nikitabobko/tap/aerospace \
  scroll-reverser \
  vorssaint
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

### Schritt 7: Shell initialisieren & private Overrides anlegen
1. Shell neu starten:
   ```bash
   exec zsh
   ```
2. Neovim einmalig starten, um Lazy.nvim-Plugins zu synchronisieren:
   ```bash
   nvim
   ```
3. Lokale Secrets (optional):
   ```bash
   nano ~/.zsh/secrets.zsh
   ```
4. Standard-Git-Identität einrichten (erforderlich, sonst fehlen Name/E-Mail bei Commits):
   ```bash
   nano ~/.gitconfig-local
   # Inhalt:
   # [user]
   #   name = <Dein Name>
   #   email = <Deine Standard-E-Mail>
   ```
5. Persönliches Git-Profil für GitHub-Remotes (optional, z. B. Pseudonym/Privat-Mail):
   ```bash
   nano ~/.gitconfig-personal
   # Inhalt:
   # [user]
   #   name = <Personal Name>
   #   email = <Personal Email>
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
