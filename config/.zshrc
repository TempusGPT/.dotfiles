# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="half-life"
source $ZSH/oh-my-zsh.sh

# docker
fpath=(/Users/changyong/.docker/completions $fpath)
autoload -Uz compinit
compinit

# fnm
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"

# claude
export PATH="$HOME/.local/bin:$PATH"
