# Configure MCP servers
claude mcp add context7 -s user -t http https://mcp.context7.com/mcp
claude mcp add grep -s user -t http https://mcp.grep.app

# Create necessary directories
mkdir -p ~/.claude

# Symlink configuration files
ln -snf ~/.dotfiles/config/.agents/AGENTS.md ~/.claude/CLAUDE.md
