# Codex Prompt Templates

Use these templates when invoking `mcp__codex__codex`. Replace `[placeholders]` with actual content. Keep prompts focused and evidence-rich.

---

## 1. Debugging

```
## Problem
[One sentence describing the bug or unexpected behavior]

## Observed Behavior
[What actually happens -- include error messages, stack traces, or logs]

## Expected Behavior
[What should happen instead]

## Evidence Gathered
[Relevant code snippets, configuration, reproduction steps]

## Environment
[Language version, framework, OS, relevant dependencies]

## Question
[Specific question -- e.g., "What are the most likely root causes given this evidence?"]
```

## 2. Plan Review

```
## Plan
[Paste the full implementation plan]

## Context
[What problem this plan solves, any constraints or user requirements]

## Review Criteria
Evaluate this plan for:
1. **Completeness** -- Are any steps missing?
2. **Ordering** -- Are dependencies between steps respected?
3. **Risk** -- Which steps are most likely to fail or cause issues?
4. **Simplicity** -- Can any steps be simplified or removed?
5. **Testability** -- How will we verify each step succeeded?

Identify the top 3 concerns, if any.
```

## 3. Code Review

```
## Changes
[Paste the diff or describe the changes with relevant code]

## Intent
[What these changes are meant to accomplish]

## Existing Patterns
[How the codebase currently handles similar concerns]

## Review Focus
Evaluate for:
1. **Correctness** -- Logic errors, edge cases, off-by-one errors
2. **Architecture** -- Consistency with existing patterns, coupling
3. **Security** -- Injection, auth issues, data exposure
4. **Performance** -- Unnecessary allocations, N+1 queries, blocking calls

Flag only real issues. Do not suggest style changes.
```

## 4. Trade-off Analysis

```
## Decision
[What architectural or design decision needs to be made]

## Options
[List each option with a brief description]

## Constraints
[Performance requirements, team size, timeline, compatibility needs]

## Context
[Current architecture, tech stack, existing patterns]

## Question
[e.g., "Which option best balances simplicity and extensibility given these constraints?"]
```

## 5. Unblocking

```
## Current Task
[What you are trying to accomplish]

## What Worked
[Steps completed successfully so far]

## Where Stuck
[The specific point of failure or confusion]

## Already Tried
[Approaches attempted and why they failed]

## Question
[e.g., "What alternative approaches should I consider?" or "What am I missing?"]
```
