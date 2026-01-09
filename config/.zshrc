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

# rust
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# development
dev() {
  local target="${1:-.}"
  code "$target" && opencode "$target"
}
