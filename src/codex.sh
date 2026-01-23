# Create configuration file
cat > ~/.codex/config.toml << 'EOF'
[features]
web_search_request = true

[mcp_servers.context7]
url = "https://mcp.context7.com/mcp"

[mcp_servers.grep]
url = "https://mcp.grep.app"
EOF
