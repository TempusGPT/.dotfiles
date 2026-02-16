---
name: using-codex
description: >
  Use when debugging bugs or unexpected behavior,
  reviewing implementation plans before execution,
  performing code review on complex changes,
  stuck after 2+ failed attempts,
  or evaluating architectural trade-offs.
  Also use when user explicitly requests Codex analysis.
  Skip for trivial tasks or routine operations.
---

# Using Codex

## Overview

Codex MCP provides access to a second expert (different model) as a peer consultant. Treat it as a read-only colleague: ask focused questions, evaluate its perspective, then decide. Never delegate decisions to Codex -- use it to challenge your thinking and catch blind spots.

## Iron Law

**NO CODEX WITHOUT FOCUSED CONTEXT FIRST.**

Never invoke Codex with vague requests. Always: gather evidence, formulate a specific question, then invoke. A bad Codex call wastes tokens and produces noise.

## When to Use

### Strongly Recommended

- **Debugging**: After gathering evidence (logs, stack traces, reproduction steps) but before forming hypothesis
- **Plan review**: After writing an implementation plan, before presenting for user approval
- **Complex code review**: Multi-file changes, architectural shifts, security-sensitive code

### Valuable

- **Trade-off analysis**: When brainstorming yields 2+ viable approaches with non-obvious tradeoffs
- **Unblocking**: After 2+ failed attempts at solving a problem

### Skip

- Trivial tasks (typo fixes, simple renames, obvious one-liners)
- Routine operations (standard CRUD, well-understood patterns)
- High-confidence situations where the approach is clear

## The Process

### 1. Gather

Collect before invoking:

- **Problem**: What are you trying to solve?
- **Evidence**: Relevant code, errors, logs, context
- **Question**: One specific question for Codex
- **Constraints**: Environment, requirements, user preferences

### 2. Invoke

Call `mcp__codex__codex` with a structured prompt. See [references/prompt-templates.md](references/prompt-templates.md) for templates.

Default parameters:

```
sandbox: "read-only"
cwd: <current working directory>
```

Write prompts in English. Include only relevant context -- not the entire codebase.

### 3. Evaluate

Before accepting Codex output:

- Does it match the evidence you gathered?
- Does it reveal something you missed?
- Is the reasoning sound, or is it hallucinating?

Never blindly apply Codex suggestions. Cross-check against the actual codebase.

### 4. Act or Follow Up

- If the response is sufficient: proceed with implementation
- If deeper analysis is needed: use `mcp__codex__codex-reply` with the existing thread to continue the conversation
- If the response is wrong: discard and note why

## Thread Management

- **One new session per problem domain.** Do not reuse debugging threads for plan review.
- **Continue within the same analysis.** Use `mcp__codex__codex-reply` for follow-ups on the same problem.
- **Keep threads focused.** If the topic shifts, start a new session.

## Handling Disagreements

When Codex and your analysis conflict:

1. State the disagreement clearly to the user
2. Present evidence supporting each position
3. Optionally: follow up with Codex, identifying yourself as Claude, to have a peer discussion
4. The user decides -- never silently override either perspective

## Red Flags

These thoughts mean you are rationalizing skipping Codex:

| Thought                             | Reality                                                    |
| ----------------------------------- | ---------------------------------------------------------- |
| "I'm pretty sure I know the answer" | Codex catches blind spots you cannot see                   |
| "This will take too long"           | A 30-second call can save 30 minutes of debugging          |
| "The problem is too simple"         | If you have been stuck for 2+ attempts, it is not simple   |
| "I will check Codex later"          | Later never comes. Check now.                              |
| "Codex will just agree with me"     | Different model, different perspective. That is the point. |
| "I do not want to slow down"        | Slow is smooth, smooth is fast.                            |

## Integration with Superpowers

| Workflow                 | When to Invoke Codex                                | How                                                               |
| ------------------------ | --------------------------------------------------- | ----------------------------------------------------------------- |
| `systematic-debugging`   | After Phase 1 evidence gathering, before hypothesis | Debugging template: share evidence, ask for root cause candidates |
| `writing-plans`          | After plan is written, before presenting to user    | Plan review template: ask for completeness, risk, ordering        |
| `executing-plans`        | When hitting a blocker or unexpected failure        | Unblocking template: share what worked, where stuck               |
| `brainstorming`          | When evaluating 2+ viable approaches                | Trade-off template: share options, constraints, ask for analysis  |
| `requesting-code-review` | Alongside code review for complex changes           | Code review template: share diff, intent, ask for issues          |

## Language Rule

- Write all Codex prompts in **English** (for model performance)
- Present Codex results to the user in **Korean** (per user preference)
