# Terminal Setup

Personal terminal configuration with Zsh, Starship, and Ghostty using Catppuccin theme.

## What's Included

- **Zsh** with antidote plugin manager
- **Starship** prompt with custom Catppuccin styling  
- **Ghostty** terminal with vim-like split management
- **Consistent theming** across all components

### Zsh Plugins (via Antidote)
- `zsh-users/zsh-completions` - Enhanced tab completion
- `zsh-users/zsh-autosuggestions` - Fish-like command suggestions
- `zsh-users/zsh-syntax-highlighting` - Real-time syntax highlighting
- `ohmyzsh/ohmyzsh path:plugins/colored-man-pages` - Colorized man pages

## Prerequisites

Install these before running the setup:

```bash
# Arch Linux
sudo pacman -S zsh starship ghostty ttf-jetbrains-mono stow

# Fedora
sudo dnf install zsh starship ghostty jetbrains-mono-fonts stow

# Ubuntu/Debian
sudo apt install zsh stow
# Install starship: curl -sS https://starship.rs/install.sh | sh
# Install ghostty and JetBrains Mono manually

# macOS
brew install zsh starship ghostty font-jetbrains-mono stow
```

## Installation

```bash
git clone git@github.com:AlexKeyCodes/terminal.git dotfiles
cd dotfiles
./install.sh
```

## ⚠️ Important

**Update the aliases file!** The `.aliases` file contains personal project paths and SSH connections - modify these before using.

**Adding plugins**: Edit `zsh/.zsh_plugins.txt` and run `antidote install` to update.

## Key Features

**Git aliases**: `gst`, `ga`, `gco`, `gcmsg`, `gplo`, `gpso`  
**Rails shortcuts**: `ber`, `br`, `bspec`  
**Ghostty splits**: `Ctrl+Shift+H/J/K/L` (create), `Ctrl+H/J/K/L` (navigate)  
**FZF integration**: `Ctrl+T` (files), `Ctrl+R` (history)

