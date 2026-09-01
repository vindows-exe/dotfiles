# ⌨️ Neovim & Tmux Workflow – Cheat Sheet

> **Tags:** `#dev` `#neovim` `#tmux` `#workflow` `#productivity` `#terminal`  
> **Kontext:** Schneller, fokussierter Workflow ohne Maus mit nahtloser Neovim- und Tmux-Integration auf deutschem QWERTZ/ISO-Layout (Strg auf Caps-Lock).

---

## 🖥️ Tmux Shortcuts

> **Prefix:** `Strg + a` (erst `Strg + a` drücken, dann loslassen, dann die Taste drücken)

### 1. Sessions & Projekt-Management
| Tastenkürzel | Aktion |
| :--- | :--- |
| `Prefix + f` | **Tmux-Sessionizer:** Interaktiver Projekt-Wechsel (`~/Documents/Dev`, `~/Documents/Projects`, `~/.config`) |
| `Prefix + d` | **Detach:** Session verlassen (alle Prozesse/Neovim laufen im Hintergrund weiter) |
| `Prefix + s` *(oder `w`)* | **Session-Tree:** Interaktive Liste aller laufenden Sessions & Fenster anzeigen |
| `Prefix + $` | Aktuelle Session umbenennen |
| `Prefix + r` | `tmux.conf` neu laden (z. B. nach Konfigurationsänderungen) |

### 2. Fenster (Tabs)
| Tastenkürzel | Aktion |
| :--- | :--- |
| `Prefix + c` | **Neues Fenster erstellen** (startet im aktuellen Ordner) |
| `Prefix + 1` .. `9` | Direkt zu Fenster 1 bis 9 springen |
| `Prefix + n` / `p` | Nächstes (*Next*) / Vorheriges (*Previous*) Fenster |
| `Prefix + ,` | Aktuelles Fenster umbenennen |
| `Prefix + &` | Aktuelles Fenster schließen |

### 3. Panes (Splits)
| Tastenkürzel | Aktion |
| :--- | :--- |
| `Prefix + v` | **Vertikaler Split:** Neues Terminal **rechts** daneben öffnen |
| `Prefix + s` | **Horizontaler Split:** Neues Terminal **unten** öffnen |
| `Prefix + z` | **Zoom / Toggle Fullscreen:** Aktuelles Pane maximieren / wieder verkleinern |
| `Prefix + x` | Aktuelles Pane schließen (mit Bestätigung) |
| `Prefix + {` / `}` | Aktuelles Pane nach links / rechts verschieben |

### 4. Vi-Modus & Copy/Paste
| Tastenkürzel | Aktion |
| :--- | :--- |
| `Prefix + [` | **Copy-Mode betreten:** Im Terminal-Verlauf mit `h`, `j`, `k`, `l`, `Ctrl+u`, `Ctrl+d` scrollen |
| `v` *(im Copy-Mode)* | Textmarkierung starten (wie in Vim) |
| `y` *(im Copy-Mode)* | Markierten Text in die **macOS-Zwischenablage** kopieren und Copy-Mode beenden |
| `q` *(im Copy-Mode)* | Copy-Mode ohne Kopieren verlassen |

---

## ⚡ Nahtlose Navigation (Neovim ⟷ Tmux)

Dank `vim-tmux-navigator` wechselst du ohne Prefix direkt zwischen Neovim-Splits und Tmux-Panes:

| Tastenkürzel | Richtung |
| :--- | :--- |
| `Strg + h` | Nach **links** navigieren |
| `Strg + j` | Nach **unten** navigieren |
| `Strg + k` | Nach **oben** navigieren |
| `Strg + l` | Nach **rechts** navigieren |
| `Strg + \` | Zum vorherigen Pane/Split zurückspringen |

---

## 🟢 Neovim Shortcuts

> **Leader-Taste:** `<Space>` (Leertaste)

### 1. Puffer-Navigation mit Harpoon 2
| Tastenkürzel | Aktion |
| :--- | :--- |
| `<leader>a` | Aktuelle Datei anheften (*Add to Harpoon*) |
| `<leader>h` | Harpoon Quick-Menü öffnen |
| `<leader>1` | Direkt zu Datei **1** springen |
| `<leader>2` | Direkt zu Datei **2** springen |
| `<leader>3` | Direkt zu Datei **3** springen |
| `<leader>4` | Direkt zu Datei **4** springen |
| `<leader>hn` | Nächste gepinnte Datei |
| `<leader>hp` | Vorherige gepinnte Datei |

### 2. Fuzzy Finder (Snacks Picker)
| Tastenkürzel | Aktion |
| :--- | :--- |
| `<leader><space>` | **Dateisuche:** Projektdateien durchsuchen (*Find Files*) |
| `<leader>/` | **Live-Grep:** Volltextsuche im gesamten Projekt |
| `<leader>fb` | Offene Buffer (geöffnete Dateien) durchsuchen |
| `<leader>fr` | Zuletzt geöffnete Dateien (*Recent*) |
| `<leader>sk` | Alle verfügbaren Tastenkombinationen durchsuchen (*Keymaps*) |
| `<leader>sh` | Hilfeseiten durchsuchen (*Help*) |

### 3. Schnelle Cursor-Bewegung (Flash.nvim)
| Tastenkürzel | Aktion |
| :--- | :--- |
| `s` + `2 Zeichen` | Zu beliebiger sichtbarer Position auf dem Bildschirm springen |
| `S` | Treesitter-basierte Bereichsauswahl mit Flash |

### 4. LSP & Code-Intelligenz (Java, TypeScript, Lua etc.)
| Tastenkürzel | Aktion |
| :--- | :--- |
| `gd` | **Go to Definition:** Zur Funktions-/Klassendefinition springen |
| `gr` | **References:** Alle Verwendungen des Symbols anzeigen |
| `gI` | **Implementation:** Zur Interface-Implementierung springen |
| `K` | **Hover:** Dokumentation / Typensignatur anzeigen |
| `<leader>ca` | **Code Action:** Quickfixes, Auto-Imports etc. |
| `<leader>cr` | **Rename:** Symbol projektweit umbenennen |
| `<leader>cf` | **Format:** Datei mit Conform (Prettier, Stylua etc.) formatieren |
| `]d` / `[d` | Zum nächsten / vorherigen Fehler bzw. Warnung springen |
| `<leader>xx` | Diagnose-Übersicht via Trouble öffnen |

### 5. Git-Workflow (Gitsigns)
| Tastenkürzel | Aktion |
| :--- | :--- |
| `]h` / `[h` | Zum nächsten / vorherigen geänderten Code-Abschnitt (*Hunk*) springen |
| `<leader>ghs` | Aktuellen Hunk zur Git-Staging-Area hinzufügen (*Stage*) |
| `<leader>ghr` | Aktuellen Hunk verwerfen (*Reset*) |
| `<leader>ghp` | Vorschau der Git-Änderung im aktuellen Hunk (*Preview*) |
| `<leader>gb` | Git-Blame für die aktuelle Zeile anzeigen |

### 6. Code bearbeiten & Kommentieren
| Tastenkürzel | Aktion |
| :--- | :--- |
| `gcc` | Aktuelle Zeile ein-/auskommentieren |
| `gc` *(im Visual Mode)* | Markierten Block ein-/auskommentieren |
| `<leader>sr` | Projektweites Suchen & Ersetzen (*Grug-Far*) |
| `vai` / `vii` | Einrückungs-Block auswählen (*mini.ai Indent*) |
| `vaf` / `vif` | Ganze Funktion auswählen (*mini.ai Function*) |

---

## 💡 Der ideale Tages-Flow auf einen Blick

```text
1. Terminal öffnen -> `Prefix + f` -> Projekt auswählen
2. `nvim` starten -> Hauptdateien mit `<leader>a` pinnen -> mit `<leader>1..4` navigieren
3. `Prefix + v` drücken -> Rechts startet Claude Code (`claude`)
4. Mit `Strg + h` (Nvim) und `Strg + l` (Claude) blitzschnell wechseln
5. Bei Bedarf: `Prefix + z` zum Vollbild-Fokusieren, `Prefix + c` für Server/Logs
```
