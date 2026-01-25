# Configure MCP servers for Claude Code
claude mcp add codex -s user -- npx -y codex-mcp-server@latest
claude mcp add context7 -s user -t http https://mcp.context7.com/mcp
claude mcp add grep-app -s user -t http https://mcp.grep.app

# Create configuration file for Codex
cat > ~/.codex/config.toml << 'EOF'
model = "gpt-5.2"
model_reasoning_effort = "xhigh"
sandbox_mode = "read-only"
EOF
