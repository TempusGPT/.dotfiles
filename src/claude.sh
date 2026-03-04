# Create necessary directory
mkdir -p ~/.claude

# Symlink configuration files
ln -snf ~/.dotfiles/config/.claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -snf ~/.dotfiles/config/.claude/settings.json ~/.claude/settings.json

# Install MCP servers
claude mcp add context7 -s user -t http https://mcp.context7.com/mcp
claude mcp add grep -s user -t http https://mcp.grep.app
