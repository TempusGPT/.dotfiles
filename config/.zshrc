# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="half-life"
source $ZSH/oh-my-zsh.sh

# Docker Desktop
fpath=(/Users/changyong/.docker/completions $fpath)
autoload -Uz compinit
compinit

# Fast Node Manager
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"

# Rustup
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
