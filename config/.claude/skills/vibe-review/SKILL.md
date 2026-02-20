---
name: vibe-review
description: |
  This skill should be used when plan documents or code changes need independent review. Trigger phrases include "review this code", "review this plan", "check my implementation", "code review", "plan review". Also triggered automatically by vibe-plan after plan writing and by vibe-code after all tasks complete.
---

# Vibe Review

Delegate review to Codex MCP for independent assessment. Different prompt templates for plan review vs code review.

**Core principle:** A fresh model catches what the author misses.

**Critical: Codex has full shell and file access.** Never paste file contents, diffs, or plan documents into the prompt. Provide file paths and git commands — Codex reads them itself. This avoids bloating the prompt with thousands of lines of source code.

DO NOT add file paths, directory listings, or any other context beyond what the prompt templates below specify. Codex finds what it needs from the plan file and git diff.

## Determine Review Type

| Signal                                   | Review Type     |
| ---------------------------------------- | --------------- |
| Target is a `docs/plans/*.md` file       | **Plan Review** |
| Target is code changes (git diff exists) | **Code Review** |
| Ambiguous                                | Ask the user    |

## Plan Review

### When

- After vibe-plan writes a plan document
- User asks to review a plan

### Gather Context

1. Note the **file path** to the plan document (do NOT read it — Codex reads it itself)
2. Note the project's tech stack

### Dispatch to Codex

Call `mcp__codex__codex`:

```
prompt: |
  Review this implementation plan for completeness and quality.

  ## File to Read
  **Plan:** [plan file path relative to project root, e.g. docs/plans/2025-01-15-auth.md]

  Read this file yourself before reviewing. The plan contains the requirements summary in its header.

  ## Review Criteria
  1. **Completeness** — Does the plan cover ALL requirements? Any gaps?
  2. **Task Granularity** — Are tasks bite-sized (2-5 min each)? Any too large?
  3. **File Paths** — Are all file paths exact and verifiable?
  4. **Commands** — Are all commands complete with expected output?
  5. **YAGNI** — Any over-engineering or unnecessary features?
  6. **Ordering** — Are tasks in logical order? Dependencies respected?
  7. **Edge Cases** — Are error handling and edge cases covered?

  ## Output Format
  ### Verdict: [APPROVED / NEEDS CHANGES]
  ### Strengths
  [what is well done]
  ### Issues
  #### Critical (must fix before implementation)
  [missing requirements, incorrect approach]
  #### Important (should fix)
  [granularity issues, unclear instructions]
  #### Minor (nice to have)
  [style, optimization]

cwd: [project root]
sandbox: "read-only"
```

## Code Review

### When

- After vibe-code completes all tasks
- User asks to review code changes

### Gather Context

1. Get the diff range:
   ```bash
   BASE_SHA=$(git merge-base HEAD main)
   HEAD_SHA=$(git rev-parse HEAD)
   ```
2. Note the plan file path (do NOT read or paste its contents)

### Dispatch to Codex

Call `mcp__codex__codex`:

```
prompt: |
  Review these code changes for production readiness.

  ## What Was Implemented
  [brief description — 1-2 sentences, NOT full plan content]

  ## How to See the Changes
  **Plan file:** [plan file path, e.g. docs/plans/2025-01-15-auth.md] — read this for requirements context
  **Diff:** Run `git diff --stat {BASE_SHA}..{HEAD_SHA}` and `git diff {BASE_SHA}..{HEAD_SHA}`

  Read the plan file and run the diff commands yourself before reviewing.

  ## Review Criteria
  **Plan Alignment:**
  - All requirements implemented? No scope creep?

  **Code Quality:**
  - Clean separation of concerns? Proper error handling?
  - Type safety? DRY principle? Edge cases handled?

  **Testing:**
  - Tests verify behavior (not implementation details)?
  - Edge cases covered? All tests passing?

  **Architecture:**
  - Follows existing patterns? No unnecessary complexity?

  ## Output Format
  ### Verdict: [APPROVED / NEEDS CHANGES]
  ### Strengths
  [what is well done, with file:line references]
  ### Issues
  #### Critical (must fix)
  [bugs, security issues, data loss risks]
  #### Important (should fix)
  [architecture problems, missing tests]
  #### Minor (nice to have)
  [style, optimization]
  For each issue: file:line, what is wrong, how to fix.

cwd: [project root]
sandbox: "read-only"
```

## Process Results

**APPROVED:**

- Report approval to the calling skill or user
- For vibe-plan: proceed to user confirmation, then vibe-code
- For vibe-code: proceed to merge options

**NEEDS CHANGES:**

- Categorize issues: Critical / Important / Minor
- Present the categorized issues to the user

## Re-Review After Changes

When issues have been fixed and need re-review:

1. Use `mcp__codex__codex-reply` with the threadId from the initial review
2. Prompt: "Issues have been addressed. Please re-review. Changes: [brief description of what was fixed]"
3. Process results the same way (APPROVED or NEEDS CHANGES)

NEVER open a new Codex session (`mcp__codex__codex`) for re-review.
The existing thread has full context of what was reviewed and what issues were found.

## Red Flags

| Temptation                       | Reality                                                                         |
| -------------------------------- | ------------------------------------------------------------------------------- |
| "It looks fine, skip the review" | Independent review exists because self-review is blind to its own assumptions.  |
| "Only minor issues, ship it"     | Read the issues. "Minor" from Codex may be important in context.                |
| "Codex approved, we're done"     | Codex approval is one signal, not a guarantee. Verify Critical items yourself.  |
| "No time for plan review"        | A flawed plan produces flawed code. 30 seconds of review saves hours of rework. |

## Integration

**Called by:**

- vibe-plan — after plan writing (plan review)
- vibe-code — after all tasks complete (code review)
- User directly — "review this code", "review this plan"

**Uses:**

- `mcp__codex__codex` — dispatch Codex review session
- `mcp__codex__codex-reply` — continue existing session
