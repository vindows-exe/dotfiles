# 💻 Laptop Setup & Dotfiles Guide

Eine vollständige Übersicht aller Anwendungen, Konfigurationsmodule und eine Schritt-für-Schritt-Anleitung für die Neuinstallation auf einem neuen Rechner (macOS / Linux).

---

## 📦 1. Übersicht der Tools & Apps

### 🖥️ Window Management & Statusbar (macOS)
| App | Funktion & Zweck | Installationsbefehl |
| :--- | :--- | :--- |
| **[AeroSpace](https://github.com/nikitabobko/AeroSpace)** | i3-artiger Tiling Window Manager für macOS mit Multi-Monitor-Workspace-Routing | `brew install --cask nikitabobko/tap/aerospace` |
| **[Sketchybar](https://github.com/FelixKratz/Sketchybar)** | Hochgradig anpassbare macOS-Statusleiste (AeroSpace-Workspaces, Akku, WLAN, Uhr) im Gruvbox-Stil | `brew install felixkratz/formulae/sketchybar` |
| **[JankyBorders](https://github.com/FelixKratz/JankyBorders)** | Animierte, abgerundete Fensterrahmen im Gruvbox-Orange-Look (`0xfffe8019`) | `brew install felixkratz/formulae/borders` |
| **[Karabiner-Elements](https://karabiner-elements.pqrs.org/)** | Systemweites Tastaturmapping (`Caps-Lock` als Hyper-Modifier) | `brew install --cask karabiner-elements` |
| **[Ghostty](https://ghostty.org/)** | GPU-beschleunigter Terminal-Emulator mit JetBrains Mono & Gruvbox-Hard Theme | `brew install --cask ghostty` |
| **[Raycast](https://www.raycast.com/)** | Spotlight-Alternative & Script-Launcher für macOS | `brew install --cask raycast` |

---

### ⚡️ CLI Tools & Entwickler-Stack
| Tool | Funktion & Zweck | Installationsbefehl (Homebrew Formula) |
| :--- | :--- | :--- |
| **[Neovim](https://neovim.io/)** | LazyVim IDE mit Snacks, Harpoon, LSP und nativer Tmux-Navigation | `brew install neovim` |
| **[Tmux](https://github.com/tmux/tmux)** | Terminal-Multiplexer (`C-a` Prefix, Splits, Session-Management) | `brew install tmux` |
| **[GNU Stow](https://www.gnu.org/software/stow/)** | Symlink-Manager für modulare Dotfiles-Pakete | `brew install stow` |
| **[Starship](https://starship.rs/)** | Hochperformanter, modularer Gruvbox-Prompt | `brew install starship` |
| **[Yazi](https://github.com/sxyazi/yazi)** | Moderner asynchroner Terminal-Dateimanager mit Bildvorschau | `brew install yazi` |
| **[fzf](https://github.com/junegunn/fzf)** | Fuzzy-Finder für Pfade, History und Tmux-Sessionizer | `brew install fzf` |
| **[ripgrep](https://github.com/BurntSushi/ripgrep)** | Ultraschnelle rekursive Code- und Textsuche (`rg`) | `brew install ripgrep` |
| **[eza](https://github.com/eza-community/eza)** | Moderner Ersatz für `ls` mit Git-Status, Icons und Farben | `brew install eza` |
| **[bat](https://github.com/sharkdp/bat)** | `cat`-Klon mit Syntax-Highlighting im Gruvbox-Theme | `brew install bat` |
| **[fnm](https://github.com/Schniz/fnm)** | Schneller Node.js Versionsmanager (Fast Node Manager) | `brew install fnm` |
| **Zsh Plugins** | Autosuggestions (`zsh-autosuggestions`) & Syntax Highlighting | `brew install zsh-autosuggestions zsh-syntax-highlighting` |

---

### 🔤 Erforderliche Schriftart
- **[JetBrainsMono Nerd Font](https://www.nerdfonts.com/)**: Erforderlich für alle Terminal-Icons, Powerline-Glyphen und Ghostty.
  ```bash
  brew install --cask font-jetbrains-mono-nerd-font
  ```

---

## 🗂️ 2. Übersicht der Dotfiles-Pakete

Alle Konfigurationen liegen modular in `~/dotfiles` und werden per GNU Stow in `$HOME` eingehängt:

| Stow-Paket | Ziel im System | Enthaltene Dateien / Funktion |
| :--- | :--- | :--- |
| **`aerospace`** | `~/.config/aerospace/aerospace.toml` | Keybindings (`Cmd+Alt+h/j/k/l`), Gaps, Multi-Monitor-Layout |
| **`borders`** | `~/.config/borders/bordersrc` | JankyBorders Einstellungen (Rundung, Strichstärke, Gruvbox-Orange) |
| **`sketchybar`** | `~/.config/sketchybar/` | `sketchybarrc`, `colors.sh` & Plugin-Skripte (`aerospace.sh`, `battery.sh`, `wifi.sh` etc.) |
| **`ghostty`** | `~/.config/ghostty/config`<br>`~/.config/ghostty/themes/gruvbox-dark-hard` | Schriftgröße 14, Farben, Cursor, Neovim-Alt-Key-Verhalten |
| **`git`** | `~/.gitconfig`<br>`~/.config/git/ignore` | Globaler User, Editor (`nvim`), globale Ignore-Muster |
| **`karabiner`** | `~/.config/karabiner/karabiner.json` | Mapping von `Caps-Lock` auf `Cmd+Ctrl+Opt+Shift` |
| **`nvim`** | `~/.config/nvim/` | LazyVim Konfiguration, Lua-Plugins, Lockfiles & Themes |
| **`opencode`** | `~/.config/opencode/` | KI-Agenten Prompts (`coder`, `architect`, `reviewer`) & Konfig |
| **`raycast-scripts`** | `~/.config/RaycastScripts/` | Skript-Befehle (z. B. `chrome-new-window.sh`) |
| **`starship`** | `~/.config/starship.toml` | Gruvbox-Dark Farbpalette, Prompt-Symbole, Statusanzeigen |
| **`tmux`** | `~/.config/tmux/tmux.conf`<br>`~/.config/tmux/tmux-sessionizer` | TrueColor, Splits, Navigation & `tmux-sessionizer` Projekt-Finder |
| **`yazi`** | `~/.config/yazi/yazi.toml` | Preview-Größen, Lanczos3-Skalierung, Sortierlogik |
| **`zsh`** | `~/.zshrc`<br>`~/.zprofile`<br>`~/.zsh/ng_completion.zsh` | Aliases (`ls=eza`, `vim=nvim`, `g=lazygit`), Brew-Env, Plugins |

---

## 🚀 3. Anleitung: Installation auf einem neuen Laptop

### Schritt 1: Xcode Command Line Tools installieren (nur macOS)
Öffne das Standard-Terminal von macOS und führe aus:
```bash
xcode-select --install
```
*(Folge dem Dialog und warte kurz, bis die Tools installiert sind.)*

---

### Schritt 2: GitHub SSH-Key einrichten (Empfohlen)
Erstelle einen SSH-Schlüssel für GitHub:
```bash
ssh-keygen -t ed25519 -C "deine.email@domain.com"
cat ~/.ssh/id_ed25519.pub
```
*(Kopiere den Public Key und trage ihn unter [github.com/settings/keys](https://github.com/settings/keys) ein.)*

---

### Schritt 3: Dotfiles klonen & Bootstrap ausführen (One-Liner)

```bash
git clone git@github.com:<dein-github-username>/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./install.sh
```

> **Was das Bootstrap-Skript `install.sh` automatisch erledigt:**
> 1. Installiert Homebrew (falls noch nicht vorhanden).
> 2. Installiert alle CLI-Pakete, JankyBorders & Sketchybar.
> 3. Setzt Ausführungsrechte für Skripte (`tmux-sessionizer`, `bordersrc`, `sketchybarrc`, Plugins).
> 4. Verlinkt alle Stow-Pakete fehlerfrei nach `~` und `~/.config`.

---

### Schritt 4: GUI Apps & Schriftart installieren (macOS)

```bash
brew install --cask \
  font-jetbrains-mono-nerd-font \
  ghostty \
  raycast \
  karabiner-elements \
  nikitabobko/tap/aerospace
```

---

### Schritt 5: Background Services starten (macOS)

Starte die Hintergrunddienste für JankyBorders und Sketchybar:
```bash
brew services start felixkratz/formulae/borders
brew services start felixkratz/formulae/sketchybar
```

---

### Schritt 6: macOS Systemeinstellungen & Berechtigungen

1. **AeroSpace & Karabiner-Elements:**
   - Öffne: **Systemeinstellungen $\rightarrow$ Datenschutz & Sicherheit $\rightarrow$ Bedienungshilfen** *(Accessibility)*.
   - Aktiviere: **AeroSpace** und **Karabiner-Elements**.
   - Öffne: **Systemeinstellungen $\rightarrow$ Datenschutz & Sicherheit $\rightarrow$ Eingabeüberwachung** *(Input Monitoring)*.
   - Aktiviere: **Karabiner-Elements** (Driver & Helper).

2. **Raycast Script Directory zuweisen:**
   - Öffne Raycast (`Cmd + Space`).
   - Gehe zu **Settings $\rightarrow$ Extensions $\rightarrow$ Script Commands**.
   - Klicke auf **Add Directory** und wähle `~/.config/RaycastScripts`.

---

### Schritt 7: Shell & Plugins initialisieren

1. Starte deine Shell neu:
   ```bash
   exec zsh
   ```
2. Öffne Neovim einmal, damit Lazy.nvim alle Plugins und Treesitter-Parser automatisch herunterlädt:
   ```bash
   nvim
   ```
3. *(Optional)* Private Secrets-Datei für API-Keys und Token anlegen (wird nicht in Git getrackt):
   ```bash
   nano ~/.zsh/secrets.zsh
   ```

---

## 🔄 4. Tägliche Wartung & Synchronisation

### Änderungen hochladen:
```bash
cd ~/dotfiles
git status
git add .
git commit -m "feat: update configs"
git push
```

### Updates auf einem anderen Laptop abrufen:
```bash
cd ~/dotfiles
git pull
./install.sh
```
