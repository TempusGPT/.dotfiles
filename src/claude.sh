# Install plugins
claude plugin install frontend-design
claude plugin install rust-analyzer-lsp
claude plugin install typescript-lsp

# Install MCP servers
claude mcp add codex -s user codex mcp-server
claude mcp add context7 -s user -t http https://mcp.context7.com/mcp

# Symlink configuration files
mkdir -p ~/.claude
ln -snf ~/.dotfiles/config/.claude/agents ~/.claude/agents
ln -snf ~/.dotfiles/config/.claude/skills ~/.claude/skills
ln -snf ~/.dotfiles/config/.claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -snf ~/.dotfiles/config/.claude/settings.json ~/.claude/settings.json
