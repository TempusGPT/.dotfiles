---
allowed-tools: Bash(claude mcp:*)
---

# Install MCP servers

Install and configure MCP servers for Claude Code.

## Command Flow

1. Check currently installed MCP servers: `claude mcp list`
2. Install universal servers if not already installed
3. Ask user which project-specific servers they want to install
4. For servers requiring credentials, prompt for necessary tokens/keys
5. Install selected project-specific servers with provided credentials

## MCP servers

### Universal

-   **Codex**: `claude mcp add codex -s user -- codex mcp -c model_reasoning_effort=high -c tools.web_search=true`
-   **Context7**: `claude mcp add context7 -s user -- npx -y @upstash/context7-mcp`

### Project-Specific

-   **Playwright**: `claude mcp add playwright npx @playwright/mcp@latest`
-   **Supabase**: `claude mcp add supabase -e SUPABASE_ACCESS_TOKEN=your_token_here -- npx -y @supabase/mcp-server-supabase@latest`
-   **shadcn/ui**: `claude mcp add shadcn npx shadcn@latest mcp`
