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

# volta
export PATH="/Users/changyong/.volta/bin:$PATH"
