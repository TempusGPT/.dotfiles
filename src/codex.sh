# Create configuration file
cat > ~/.codex/config.toml << 'EOF'
model = "gpt-5.3-codex"
model_reasoning_effort = "high"
approval_policy = "never"
EOF

# Install MCP servers
codex mcp add context7 -- https://mcp.context7.com/mcp
codex mcp add grep -- https://mcp.grep.app
