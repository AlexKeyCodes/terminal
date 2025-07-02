#!/bin/bash

echo "🚀 Setting up terminal dotfiles..."

# Check if antidote is installed
if ! command -v antidote &> /dev/null; then
    echo "📦 Installing antidote..."
    git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
fi

# Check if stow is installed (adjust for different distros)
if ! command -v stow &> /dev/null; then
    echo "📦 Installing GNU Stow..."
    if command -v pacman &> /dev/null; then
        sudo pacman -S stow
    elif command -v dnf &> /dev/null; then
        sudo dnf install stow
    elif command -v apt &> /dev/null; then
        sudo apt install stow
    fi
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
