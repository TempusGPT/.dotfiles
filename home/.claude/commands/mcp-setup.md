---
description: Install MCP servers
allowed-tools: Bash(claude mcp add:*)
---

Run installation commands:

```bash
claude mcp add codex --scope user -- codex mcp -c model_reasoning_effort="high"
claude mcp add context7 --scope user -- npx -y @upstash/context7-mcp
claude mcp add playwright --scope user -- npx @playwright/mcp@latest
```
