# Create necessary directory
mkdir -p ~/.codex

# Symlink configuration files
ln -snf ~/.dotfiles/config/.codex/AGENTS.md ~/.codex/AGENTS.md

# Create configuration file
cat > ~/.codex/config.toml << 'EOF'
model = "gpt-5.4"
model_reasoning_effort = "high"
plan_mode_reasoning_effort = "high"
service_tier = "fast"
personality = "friendly"
EOF

# Enable experimental features
codex features enable js_repl
codex features enable multi_agent
codex features enable prevent_idle_sleep

# Install MCP servers
codex mcp add context7 --url https://mcp.context7.com/mcp
codex mcp add grep --url https://mcp.grep.app
