---
name: using-codex
description: >
  MANDATORY second-opinion checkpoint via Codex (a different AI model as peer consultant).
  YOU MUST invoke this skill at these points during other superpowers workflows:
  (1) systematic-debugging — after evidence gathering, before hypothesis formation
  (2) writing-plans — after plan draft, before presenting to user for approval
  (3) brainstorming — when 2+ viable approaches identified, before recommending one
  (4) executing-plans — when blocked after 2+ failed attempts
  (5) requesting-code-review — for complex multi-file or security-sensitive changes.
  Also invoke when user explicitly requests Codex, second opinion, or peer review.
  If you just completed debugging, planning, or brainstorming WITHOUT calling Codex, STOP and invoke it now.
  Skip ONLY for trivial tasks (typo fixes, obvious one-liners, routine CRUD).
---

# Using Codex

Codex MCP provides a different model as read-only peer consultant. Ask focused questions, evaluate its perspective, then decide. Never delegate decisions -- use it to catch blind spots.

## Checkpoints — When to Invoke

These are NON-OPTIONAL integration points. If you are in one of these workflows, you MUST hit the Codex checkpoint.

| You are running...       | Codex checkpoint                                    | Template to use |
| ------------------------ | --------------------------------------------------- | --------------- |
| `systematic-debugging`   | After Phase 1 evidence gathering, before hypothesis | Debugging       |
| `writing-plans`          | After plan draft, before presenting to user         | Plan Review     |
| `brainstorming`          | When evaluating 2+ viable approaches                | Trade-off       |
| `executing-plans`        | When blocked or hitting unexpected failure          | Unblocking      |
| `requesting-code-review` | For complex or security-sensitive changes           | Code Review     |

If you realize you passed a checkpoint without invoking Codex, go back and invoke it before proceeding.

## Iron Law

**NO CODEX WITHOUT FOCUSED CONTEXT FIRST.**

Always: gather evidence → formulate a specific question → then invoke. A vague Codex call wastes tokens and produces noise.

## Process

### 1. Gather

- **Problem**: One sentence
- **Evidence**: Relevant code, errors, logs
- **Question**: One specific question for Codex
- **Constraints**: Environment, requirements, user preferences

### 2. Invoke

Call `mcp__codex__codex` with a structured prompt from [references/prompt-templates.md](references/prompt-templates.md).

```
sandbox: "read-only"
cwd: <current working directory>
```

Write prompts in English. Include only relevant context.

### 3. Evaluate

- Does it match your evidence?
- Does it reveal something you missed?
- Is the reasoning sound, or hallucinated?

Never blindly apply Codex suggestions. Cross-check against actual code.

### 4. Act or Follow Up

- Sufficient → proceed with implementation
- Need more → `mcp__codex__codex-reply` on same thread
- Wrong → discard and note why

## Thread Management

- One new session per problem domain
- Use `mcp__codex__codex-reply` for follow-ups on the same problem
- Start a new session if the topic shifts

## Handling Disagreements

1. State the disagreement clearly to the user
2. Present evidence for each position
3. Optionally: follow up with Codex to have a peer discussion
4. The user decides

## Anti-Skip Rationalization

| Thought                             | Reality                                                    |
| ----------------------------------- | ---------------------------------------------------------- |
| "I'm pretty sure I know the answer" | Codex catches blind spots you cannot see                   |
| "This will take too long"           | A 30-second call saves 30 minutes of debugging             |
| "The problem is too simple"         | 2+ failed attempts means it is not simple                  |
| "I will check Codex later"          | Later never comes. Check now.                              |
| "Codex will just agree with me"     | Different model, different perspective. That is the point. |
| "I already know the fix"            | Verify with Codex anyway. Confidence ≠ correctness.        |

## Language Rule

- Codex prompts: **English** (model performance)
- Results to user: **Korean** (user preference)
