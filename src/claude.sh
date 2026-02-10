# Install MCP servers
claude mcp add codex --scope user codex mcp-server

# Install official plugins
claude plugin install code-review
claude plugin install code-simplifier
claude plugin install context7
claude plugin install feature-dev
claude plugin install frontend-design
claude plugin install typescript-lsp

# Symlink configuration files
mkdir -p ~/.claude
ln -snf ~/.dotfiles/config/.claude/CLAUDE.md ~/.claude/CLAUDE.md
