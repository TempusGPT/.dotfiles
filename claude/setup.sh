# Create necessary directory
mkdir -p ~/.claude

# Symlink configuration files
ln -snf ~/.dotfiles/claude/skills ~/.claude/skills
ln -snf ~/.dotfiles/claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -snf ~/.dotfiles/claude/settings.json ~/.claude/settings.json
