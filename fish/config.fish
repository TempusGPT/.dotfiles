/opt/homebrew/bin/brew shellenv fish | source
source ~/.orbstack/shell/init2.fish 2>/dev/null; or true

fish_add_path /opt/homebrew/opt/rustup/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

starship init fish | source

function _newline_after_prompt --on-event fish_preexec
    echo
end
