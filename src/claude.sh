# Install Claude Code
npm install -g @anthropic-ai/claude-code

# Configure MCP servers
claude mcp add codex -s user -- codex mcp -c model_reasoning_effort=high -c model_verbosity=high -c tools.web_search=true
claude mcp add context7 -s user -- npx -y @upstash/context7-mcp
