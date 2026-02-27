# Create necessary directory
mkdir -p ~/.codex

# Create configuration file
cat > ~/.codex/config.toml << 'EOF'
model = "gpt-5.3-codex"
model_reasoning_effort = "high"
plan_mode_reasoning_effort = "high"
personality = "pragmatic"

[features]
multi_agent = true
prevent_idle_sleep = true
EOF

# Install MCP servers
codex mcp add context7 --url https://mcp.context7.com/mcp
codex mcp add grep --url https://mcp.grep.app

# Install agent skills
npx skills add https://github.com/mattpocock/skills -y -g -s tdd -a codex
