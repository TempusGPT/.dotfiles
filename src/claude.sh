# Create necessary directory
mkdir -p ~/.claude

# Symlink configuration files
ln -snf ~/.dotfiles/config/.claude/skills ~/.claude/skills
ln -snf ~/.dotfiles/config/.claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -snf ~/.dotfiles/config/.claude/settings.json ~/.claude/settings.json
