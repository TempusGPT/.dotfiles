---
allowed-tools: Bash(claude mcp:*)
---

# Install MCP servers

Install and configure MCP servers for Claude Code.

## Command Flow

1. Check currently installed MCP servers
2. Remove MCP servers not on the list below
3. Install MCP servers if not already installed

## MCP servers

-   **Codex**: `claude mcp add codex -s user -- codex mcp -c model_reasoning_effort=high -c tools.web_search=true`
-   **Context7**: `claude mcp add context7 -s user -- npx -y @upstash/context7-mcp`
-   **Sequential Thinking**: `claude mcp add sequential-thinking -s user -- npx -y @modelcontextprotocol/server-sequential-thinking`
