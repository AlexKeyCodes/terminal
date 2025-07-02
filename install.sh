#!/bin/bash

echo "🚀 Setting up terminal dotfiles..."

# Function to detect package manager and install packages
install_prerequisites() {
  echo "📦 Installing prerequisites..."

  if command -v pacman &>/dev/null; then
    echo "Detected Arch Linux - using pacman"
    sudo pacman -S --needed zsh starship ghostty ttf-jetbrains-mono stow
  elif command -v dnf &>/dev/null; then
    echo "Detected Fedora - using dnf"
    sudo dnf install -y zsh starship ghostty jetbrains-mono-fonts stow
  elif command -v apt &>/dev/null; then
    echo "Detected Ubuntu/Debian - using apt"
    sudo apt update
    sudo apt install -y zsh stow

    # Install starship manually for Ubuntu/Debian
    if ! command -v starship &>/dev/null; then
      echo "Installing starship..."
      curl -sS https://starship.rs/install.sh | sh
    fi

    echo "⚠️  Note: Please install Ghostty and JetBrains Mono font manually on Ubuntu/Debian"
    echo "   Ghostty: https://ghostty.org/"
    echo "   JetBrains Mono: https://www.jetbrains.com/lp/mono/"

  elif command -v brew &>/dev/null; then
    echo "Detected macOS - using Homebrew"
    brew install zsh starship ghostty font-jetbrains-mono stow
  else
    echo "⚠️  Unsupported package manager. Please install manually:"
    echo "   - zsh, starship, ghostty, jetbrains-mono-font, stow"
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      exit 1
    fi
  fi
}

# Check if prerequisites are installed
missing_deps=()

if ! command -v zsh &>/dev/null; then
  missing_deps+=("zsh")
fi

if ! command -v starship &>/dev/null; then
  missing_deps+=("starship")
fi

if ! command -v ghostty &>/dev/null; then
  missing_deps+=("ghostty")
fi

if ! command -v stow &>/dev/null; then
  missing_deps+=("stow")
fi

# Install missing prerequisites
if [ ${#missing_deps[@]} -ne 0 ]; then
  echo "Missing dependencies: ${missing_deps[*]}"
  read -p "Install missing dependencies? (Y/n): " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    echo "Skipping dependency installation..."
  else
    install_prerequisites
  fi
else
  echo "✅ All prerequisites already installed"
fi

# Check if antidote is installed
if ! command -v antidote &>/dev/null; then
  echo "📦 Installing antidote..."
  git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
fi

# Deploy configurations
echo "🔗 Creating symlinks..."
stow zsh ghostty starship

# Load plugins
echo "🔌 Loading zsh plugins..."
source ~/.antidote/antidote.zsh
antidote install

echo "✅ Dotfiles setup complete!"
echo "💡 Restart your terminal or run 'source ~/.zshrc' to apply changes"

# Offer to change default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
  echo ""
  read -p "Set zsh as your default shell? (Y/n): " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    chsh -s $(which zsh)
    echo "✅ Default shell changed to zsh (takes effect on next login)"
  fi
fi
