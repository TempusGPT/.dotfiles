# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="half-life"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# docker-desktop
fpath=(/Users/changyong/.docker/completions $fpath)
autoload -Uz compinit
compinit

# claude-code
alias claude="/Users/changyong/.claude/local/claude"
export EDITOR="code"

# fnm
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"
