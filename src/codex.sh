# Create necessary directory
mkdir -p ~/.codex

# Symlink configuration files
ln -snf ~/.dotfiles/config/.codex/skills ~/.codex/skills/user
ln -snf ~/.dotfiles/config/.codex/AGENTS.md ~/.codex/AGENTS.md
ln -snf ~/.dotfiles/config/.codex/config.toml ~/.codex/config.toml

# Set up clean filter to ignore trust entries
git -C ~/.dotfiles config filter.codex-config.clean "head -n 27"
git -C ~/.dotfiles config filter.codex-config.smudge cat
