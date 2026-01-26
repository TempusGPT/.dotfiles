# Create necessary directories
mkdir -p ~/.config/opencode

# Symlink configuration files
ln -snf ~/.dotfiles/config/.config/opencode/skills ~/.config/opencode/skills
ln -snf ~/.dotfiles/config/.config/opencode/AGENTS.md ~/.config/opencode/AGENTS.md
ln -snf ~/.dotfiles/config/.config/opencode/opencode.json ~/.config/opencode/opencode.json
