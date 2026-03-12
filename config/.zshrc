# Starship
eval "$(starship init zsh)"

# Zsh Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fast Node Manager
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"

# Rustup
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
