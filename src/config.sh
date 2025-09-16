# Create necessary directories
mkdir -p ~/.claude
mkdir -p ~/.codex
mkdir -p ~/.config/karabiner/assets/complex_modifications

# Symlink configuration files
ln -snf ~/.dotfiles/config/.claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -snf ~/.dotfiles/config/.claude/settings.json ~/.claude/settings.json
ln -snf ~/.dotfiles/config/.codex/AGENTS.md ~/.codex/AGENTS.md
ln -snf ~/.dotfiles/config/.config/karabiner/assets/complex_modifications/rules.json ~/.config/karabiner/assets/complex_modifications/rules.json
ln -snf ~/.dotfiles/config/.gitconfig ~/.gitconfig
ln -snf ~/.dotfiles/config/.zprofile ~/.zprofile
ln -snf ~/.dotfiles/config/.zshrc ~/.zshrc
