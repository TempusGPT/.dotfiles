# Create configuration file
cat > ~/.codex/config.toml << 'EOF'
model = "gpt-5.2-codex"
model_reasoning_effort = "high"
suppress_unstable_features_warning = true

[features]
collaboration_modes = true
unified_exec = true
shell_snapshot = true
steer = true

[mcp_servers.context7]
url = "https://mcp.context7.com/mcp"

[mcp_servers.grep]
url = "https://mcp.grep.app"
EOF

# Create necessary directories
mkdir -p ~/.codex

# Symlink configuration files
ln -snf ~/.dotfiles/config/.agents/AGENTS.md ~/.codex/AGENTS.md
