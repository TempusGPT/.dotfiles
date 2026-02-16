# Install official plugins
claude plugin install superpowers
claude plugin install typescript-lsp
claude plugin install rust-analyzer-lsp
claude plugin install frontend-design

# Install context7 plugin
claude plugin marketplace add upstash/context7
plugin install context7-plugin@context7-marketplace

# Install codex MCP
claude mcp add codex --scope user codex mcp-server

# Symlink configuration files
mkdir -p ~/.claude
ln -snf ~/.dotfiles/config/.claude/skills ~/.claude/skills
ln -snf ~/.dotfiles/config/.claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -snf ~/.dotfiles/config/.claude/settings.json ~/.claude/settings.json
