---
name: vibe-debug
description: |
  This skill should be used when encountering bugs, test failures, or unexpected behavior that needs systematic analysis. Trigger phrases include "debug this", "why is this failing", "investigate this error", "this test is broken", "unexpected behavior". Also triggered automatically by vibe-implementer when self-fix attempts are exhausted during task verification.
---

# Vibe Debug

Delegate bug analysis to Codex MCP for isolated, systematic investigation. Codex debugs in a sandbox; integrate the findings after verification.

## Iron Law

```
NO FIX WITHOUT VERIFIED ROOT CAUSE
```

Never apply a fix based on speculation. Codex proposes, evidence confirms.

## Process

### Step 1: Gather Context

Before calling Codex, collect concrete evidence:

1. **Error message** — exact text, stack trace, exit code
2. **Reproduction** — steps or command to trigger the bug
3. **Recent changes** — `git diff` and `git log --oneline -5`

Collect concise evidence. **Do NOT read file contents or list file paths to paste into the prompt.** Codex has full filesystem access and will find relevant files from the error message, stack trace, and git diff.

### Step 2: Dispatch to Codex

**Critical: Codex has full shell and file access.** Never paste file contents or diff output into the prompt. Provide file paths and commands — Codex reads them itself.

Call `mcp__codex__codex` with the debug prompt template:

```
prompt: |
  Analyze this bug systematically. Find the root cause before proposing any fix.
  If you need to experiment (modify files, run tests), create a worktree first.
  NEVER modify files outside the worktree. Clean up the worktree when done.

  ## Bug Report
  **Symptom:** [description of what's wrong]
  **Error:** [exact error message — this is the ONE thing to paste, not file contents]
  **Reproduction:** [steps or command to trigger]

  ## Context
  **Project:** [absolute path to project root]
  **Tech Stack:** [language, framework, test runner]
  **Recent Changes:** Run `git diff` and `git log --oneline -5` to see

  Do NOT list file paths. Codex has full filesystem access and will find relevant files
  from the error message, stack trace, and git diff.

  ## Instructions
  1. Read the error carefully — what is it actually telling you?
  3. Trace data flow backward from the error to the source
  4. Identify the root cause (not the symptom)
  5. Propose ONE specific fix with exact file:line references
  6. Explain how to verify the fix works

  Do NOT propose multiple speculative fixes.
  If you cannot determine root cause, say so and explain what you investigated.

cwd: [project root]
sandbox: "workspace-write"
```

To continue an existing Codex session with additional context, use `mcp__codex__codex-reply` with the `threadId` from the initial response.

### Step 3: Evaluate Results

**Codex identifies root cause:**

1. Verify the analysis matches the evidence — do not trust blindly
2. Check the proposed fix against the codebase (does the file:line exist? is the logic sound?)
3. Apply the fix in the main workspace (not the worktree)
4. Run verification: tests, typecheck, lint

**Codex analysis is insufficient:**

1. Add more context (broader git diff, related files, logs)
2. Re-dispatch with `mcp__codex__codex-reply` on the same thread
3. Try a different angle (ask about a specific hypothesis)

## Red Flags

| Temptation                       | Reality                                                      |
| -------------------------------- | ------------------------------------------------------------ |
| "Just try this fix and see"      | Root cause first. Symptom fixes create new bugs.             |
| "Codex said it, must be right"   | Verify every claim against actual code.                      |
| "One more attempt will solve it" | Limit reached = escalate. Fresh human eyes beat stale loops. |

## Integration

**Called by:**

- vibe-implementer — when self-fix attempts (2 strikes) are exhausted during task verification
- User directly — "debug this", "why is this failing"

**Uses:**

- `mcp__codex__codex` — dispatch Codex analysis session
- `mcp__codex__codex-reply` — continue existing session
