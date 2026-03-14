# fnm
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"

# starship
eval "$(starship init zsh)"

# plugins
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# aliases
alias ls="ls --color=auto"
alias la="ls -lAh"
alias ll="ls -lh"

# fixes
preexec() { echo }
export LESS="-R"
