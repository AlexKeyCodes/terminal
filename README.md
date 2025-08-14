Personal terminal configuration with Zsh, Starship, and Ghostty using Catppuccin theme.

- Terminal: [Ghostty](https://ghostty.org/)
- Shell: zsh
- Plugin Manager: [Antidote](https://antidote.sh/)
- Plugins:
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    - [zsh-completions](https://github.com/zsh-users/zsh-completions)
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- Prompt: [Starship](https://starship.rs/)
- Search: fzf
- File Management: yazi

## Prerequisites

Install these before running the setup:

```bash
# Nerd Font (I also like [MesloLGS NF](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip))
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
unzip FiraCode.zip -d FiraCode/

# Arch / Fedora Nerd Font Install
mkdir -p ~/.local/share/fonts
cp FiraCode/*.ttf ~/.local/share/fonts/
fc-cache -fv
rm -rf FiraCode/ FiraCode.zip

# MacOS Nerd Font Install
cp FiraCode/*.ttf ~/Library/Fonts/
rm -rf FiraCode/ FiraCode.zi

# Arch Linux
sudo pacman -S zsh starship ghostty stow yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide imagemagick

# Fedora (No yazi yet...)
sudo dnf install zsh starship ghostty stow fzf

# macOS
brew install zsh starship ghostty stow yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick 
```

## Installation

```bash
git clone git@github.com:AlexKeyCodes/terminal.git dotfiles
cd dotfiles
stow -t ~ ghostty
stow -t ~ zsh
stow -t ~ starship
```

## ⚠️ Important

**Update the aliases file!** The `.aliases` file contains personal project paths and SSH connections - modify these before using.

**Adding plugins**: Edit `zsh/.zsh_plugins.txt` and run `antidote install` to update.

