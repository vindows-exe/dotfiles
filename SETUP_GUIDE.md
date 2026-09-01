# 💻 Laptop Setup & Dotfiles Guide

Eine vollständige Übersicht aller Anwendungen, Konfigurationsmodule und eine Schritt-für-Schritt-Anleitung für die Neuinstallation auf einem neuen Rechner (macOS / Linux).

---

## 📦 1. Übersicht der Tools & Apps

### 🖥️ GUI & System-Anwendungen (macOS)
| App | Funktion & Zweck | Installationsbefehl (Homebrew Cask) |
| :--- | :--- | :--- |
| **[Ghostty](https://ghostty.org/)** | GPU-beschleunigter Terminal-Emulator mit JetBrains Mono & Gruvbox-Hard Theme | `brew install --cask ghostty` |
| **[AeroSpace](https://github.com/nikitabobko/AeroSpace)** | i3-artiger Tiling Window Manager für macOS mit Multi-Monitor-Workspace-Routing | `brew install --cask nikitabobko/tap/aerospace` |
| **[Karabiner-Elements](https://karabiner-elements.pqrs.org/)** | Systemweites Tastaturmapping (`Caps-Lock` als Hyper-Modifier) | `brew install --cask karabiner-elements` |
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
*(Folge dem Installationsdialog und warte kurz, bis die Tools installiert sind.)*

---

### Schritt 2: GitHub SSH-Key einrichten (Empfohlen)
Erstelle einen SSH-Schlüssel, um Repositories sicher ohne Passworteingabe zu klonen:
```bash
ssh-keygen -t ed25519 -C "deine.email@domain.com"
cat ~/.ssh/id_ed25519.pub
```
*(Kopiere den angezeigten Public Key und füge ihn auf [github.com/settings/keys](https://github.com/settings/keys) hinzu.)*

---

### Schritt 3: Dotfiles klonen & Bootstrap ausführen (One-Liner)

Führe folgenden Befehl aus:

```bash
git clone git@github.com:<dein-github-username>/dotfiles.git ~/dotfiles && cd ~/dotfiles && ./install.sh
```

> **Was das Bootstrap-Skript `install.sh` automatisch erledigt:**
> 1. Installiert Homebrew (falls noch nicht vorhanden).
> 2. Installiert alle essenziellen CLI-Pakete (`git`, `stow`, `neovim`, `tmux`, `fzf`, `ripgrep`, `eza`, `bat`, `starship`, `yazi`, `fnm`, Zsh-Plugins).
> 3. Setzt Ausführungsrechte für Skripte (`tmux-sessionizer`, `chrome-new-window.sh`).
> 4. Verlinkt alle Stow-Pakete fehlerfrei nach `~` und `~/.config`.

---

### Schritt 4: GUI Apps & Casks installieren (macOS)
Installiere die benötigten grafischen Tools und die Schriftart:

```bash
brew install --cask \
  font-jetbrains-mono-nerd-font \
  ghostty \
  raycast \
  karabiner-elements \
  nikitabobko/tap/aerospace
```

---

### Schritt 5: macOS Systemeinstellungen & Berechtigungen

Einige Tools benötigen für die Tastatur- und Fenstersteuerung spezielle macOS-Rechte:

1. **AeroSpace & Karabiner-Elements:**
   - Öffne: **Systemeinstellungen $\rightarrow$ Datenschutz & Sicherheit $\rightarrow$ Bedienungshilfen** *(Accessibility)*.
   - Aktiviere: **AeroSpace** und **Karabiner-Elements**.
   - Öffne: **Systemeinstellungen $\rightarrow$ Datenschutz & Sicherheit $\rightarrow$ Eingabeüberwachung** *(Input Monitoring)*.
   - Aktiviere: **Karabiner-Elements** (Driver & Helper).

2. **Raycast Script Directory zuweisen:**
   - Öffne Raycast (`Cmd + Space`).
   - Gehe zu **Settings $\rightarrow$ Extensions $\rightarrow$ Script Commands**.
   - Klicke auf **Add Directory** und wähle `~/.config/RaycastScripts`.

3. **Ghostty Schriftart:**
   - Ghostty verwendet automatisch `JetBrainsMono Nerd Font` aus der Konfiguration.

---

### Schritt 6: Shell & Plugins initialisieren

1. Starte deine Shell neu:
   ```bash
   exec zsh
   ```
2. Öffne Neovim einmal, damit Lazy.nvim alle Plugins und Treesitter-Parser automatisch herunterlädt:
   ```bash
   nvim
   ```
3. *(Optional)* Private Secrets-Datei für sensible Umgebungsvariablen und API-Keys anlegen:
   ```bash
   nano ~/.zsh/secrets.zsh
   # Beispiel:
   # export ANTHROPIC_API_KEY="sk-..."
   # export OPENAI_API_KEY="sk-..."
   ```

---

## 🔄 4. Tägliche Wartung & Synchronisation

### Änderungen an Dotfiles vornehmen & hochladen
Da alle Konfigurationsdateien per Symlink mit `~/dotfiles` verknüpft sind, kannst du deine Configs wie gewohnt bearbeiten (z. B. `nvim ~/.config/nvim/init.lua` oder `nvim ~/.zshrc`).

Um Änderungen auf GitHub zu sichern:
```bash
cd ~/dotfiles
git status
git add .
git commit -m "feat: update neovim and tmux config"
git push
```

### Updates auf einem anderen Laptop abrufen
```bash
cd ~/dotfiles
git pull
./install.sh   # Stellt sicher, dass neue Pakete verlinkt und Tools installiert werden
```
