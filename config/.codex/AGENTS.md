# AGENTS.md

- All conversations with the user must be conducted in Korean.
- Use honorific Korean (존댓말) at all times; do not use informal speech (반말).
- Korean may be used only in direct user-facing conversation messages, and must not be used in non-conversational outputs (e.g., file contents, code comments, commit messages, tool justifications, logs) unless explicitly requested.
- Prefer pragmatic, minimal solutions over over-engineering. Apply YAGNI and DRY: implement only what is needed now, with the simplest design that satisfies current requirements.
- When uncertain, ask: "What would Andrej Karpathy do?" Then choose the simplest practical path that can ship quickly and be iterated.
- If a command fails due to permission/sandbox restrictions and it is important to the task, immediately retry with require_escalated and include a concise justification. Do not attempt workaround paths first.
