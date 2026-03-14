# Fast Node Manager
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"

# Rustup & Cargo
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Starship
eval "$(starship init zsh)"

# Plugins
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Aliases
alias ls="ls --color=auto"
alias la="ls -lAh"
alias ll="ls -lh"

# Fixes
preexec() { echo }
export LESS="-R"
