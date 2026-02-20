# Add plugin marketplaces
claude plugin marketplace add anthropics/claude-plugins-official

# Install official plugins
claude plugin install frontend-design@claude-plugins-official
claude plugin install rust-analyzer-lsp@claude-plugins-official
claude plugin install typescript-lsp@claude-plugins-official

# Install MCP servers
claude mcp add codex -s user codex mcp-server
claude mcp add context7 -s user -t http https://mcp.context7.com/mcp
claude mcp add grep -s user -t http https://mcp.grep.app

# Create necessary directory
mkdir -p ~/.claude

# Symlink configuration files
ln -snf ~/.dotfiles/config/.claude/agents ~/.claude/agents
ln -snf ~/.dotfiles/config/.claude/skills ~/.claude/skills
ln -snf ~/.dotfiles/config/.claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -snf ~/.dotfiles/config/.claude/settings.json ~/.claude/settings.json
