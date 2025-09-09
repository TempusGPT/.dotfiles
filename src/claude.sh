npm install -g @anthropic-ai/claude-code
claude mcp add codex -s user -- codex mcp -c model_reasoning_effort=high -c model_verbosity=high -c tools.web_search=true
claude mcp add context7 -s user -- npx -y @upstash/context7-mcp
claude mcp add sequential-thinking -s user -- npx -y @modelcontextprotocol/server-sequential-thinking
