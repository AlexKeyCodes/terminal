Personal terminal configuration with Zsh, Starship, and Ghostty using Catppuccin theme.

- Terminal: Ghostty
- Shell: zsh
- Plugin Manager: antibody
- Plugins:
    - https://github.com/zsh-users/zsh-syntax-highlighting
    - https://github.com/zsh-users/zsh-completions
    - https://github.com/zsh-users/zsh-autosuggestions
- Prompt: Starship
- Search: fzf

## Prerequisites

Install these before running the setup:

```bash
# Arch Linux
sudo pacman -S zsh starship ghostty ttf-jetbrains-mono stow

# Fedora
sudo dnf install zsh starship ghostty jetbrains-mono-fonts stow

# macOS
brew install zsh starship ghostty font-jetbrains-mono stow
```

## Installation

```bash
git clone git@github.com:AlexKeyCodes/terminal.git dotfiles
cd dotfiles
stow ghostty
stow zsh
stow starship
```

## ⚠️ Important

**Update the aliases file!** The `.aliases` file contains personal project paths and SSH connections - modify these before using.

**Adding plugins**: Edit `zsh/.zsh_plugins.txt` and run `antidote install` to update.

