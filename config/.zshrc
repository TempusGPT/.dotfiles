# Oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="half-life"
source $ZSH/oh-my-zsh.sh

# Docker
fpath=(/Users/changyong/.docker/completions $fpath)
autoload -Uz compinit
compinit

# Fast node manager
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"
