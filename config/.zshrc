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

# dev alias - opens opencode and code in the specified directory
dev() {
    local target_dir="${1:-.}"
    code "$target_dir"
    opencode "$target_dir"
}
