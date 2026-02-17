# Codex Prompt Templates

Use these templates when invoking `mcp__codex__codex`. Replace `[placeholders]` with actual content.

**Key rule**: Point to file paths. Do NOT paste file contents — Codex will read them itself.

---

## 1. Debugging

```
## Problem
[One sentence describing the bug]

## Key Files
- [path/to/file.ts] — [what this file does and why it's relevant]
- [path/to/other.ts:42-60] — [specific area of interest]

## Observed Behavior
[Error messages or symptoms — keep concise]

## Expected Behavior
[What should happen instead]

## Question
[e.g., "What are the most likely root causes?"]
```

## 2. Plan Review

```
## Plan
[The plan is in [path/to/plan.md] OR paste a short bullet list if the plan isn't saved to a file]

## Goal
[One sentence: what problem this plan solves]

## Key Files Affected
- [path/to/file.ts] — [how it will change]

## Review Criteria
Evaluate for: completeness, ordering, risk, simplicity, testability.
Identify the top 3 concerns, if any.
```

## 3. Code Review

```
## What Changed
[One sentence summary of the changes]

## Files to Review
- [path/to/file.ts] — [what changed and why]
- [path/to/other.ts:30-50] — [specific change area]

## Intent
[What these changes accomplish]

## Review Focus
Evaluate for: correctness, architecture consistency, security, performance.
Flag only real issues. Do not suggest style changes.
```

## 4. Trade-off Analysis

```
## Decision
[What architectural or design decision needs to be made]

## Options
1. [Option A] — [brief description]
2. [Option B] — [brief description]

## Constraints
[Performance, compatibility, timeline needs]

## Relevant Code
- [path/to/file.ts] — [explore this for current patterns]

## Question
[e.g., "Which option best balances simplicity and extensibility?"]
```

## 5. Unblocking

```
## Current Task
[What you are trying to accomplish]

## Relevant Files
- [path/to/file.ts] — [area where the problem occurs]

## What Failed
[Approaches attempted and why they failed — keep concise]

## Question
[e.g., "What alternative approaches should I consider?"]
```
