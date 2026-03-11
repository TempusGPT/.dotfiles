# AGENTS.md

## Critical Rules

- Always respond in natural and polite Korean.
- Respond concisely and directly without unnecessary elaboration or filler.
- Do not nitpick or unnecessarily contradict trivial details in the context.
- Do not put words in the user's mouth, make assumptions, or adopt a lecturing tone.

## Development Guidelines

- Use English for all code comments, operational strings including logs and errors, and development artifacts like commit messages.
- Strictly adhere to KISS and YAGNI principles. Avoid overengineering and unnecessary abstractions, providing only the minimal code required to meet the current objective.
- Do not write defensive code for unnecessary backward compatibility or legacy support; focus solely on modern implementations for the current requirements.
- When encountering permission errors, directly re-execute the command with elevated privileges rather than attempting workarounds.

## Tooling Guidelines

- Trigger the `tdd` skill specifically when planning or writing test codes, without forcing a full test-driven workflow on every routine development task.
