# Basic zsh configuration
autoload -Uz compinit
compinit

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Basic completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Initialize antidote
source ~/.antidote/antidote.zsh

# Initialize plugins
antidote load

# Load Starship
eval "$(starship init zsh)"

# Load aliases
if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi

# Catppuccin colors for zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#585b70'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rails
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
export PATH="$HOME/bin:$PATH"
