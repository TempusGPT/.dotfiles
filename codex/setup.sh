mkdir -p ~/.codex
ln -snf ~/.dotfiles/codex/AGENTS.md ~/.codex/AGENTS.md
ln -snf ~/.dotfiles/codex/config.toml ~/.codex/config.toml

# Set clean filter to ignore trust entries
git -C ~/.dotfiles config filter.codex-config.clean "head -n 10"
git -C ~/.dotfiles config filter.codex-config.smudge cat
