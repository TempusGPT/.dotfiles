---
name: vibe-review
description: |
  This skill should be used when plan documents or code changes need independent review. Trigger phrases include "review this code", "review this plan", "check my implementation", "code review", "plan review". Also triggered automatically by vibe-plan after plan writing and by vibe-code after all tasks complete.
---

# Vibe Review

Delegate review to Codex MCP for independent assessment. Different prompt templates for plan review vs code review.

**Core principle:** A fresh model catches what the author misses.

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

1. Read the plan document in full
2. Read the requirements document it implements (if referenced)
3. Note the project's tech stack

### Dispatch to Codex

Call `mcp__codex__codex`:

```
prompt: |
  Review this implementation plan for completeness and quality.

  ## Plan Document
  [full plan content]

  ## Requirements
  [requirements content, or "No separate requirements document"]

  ## Review Criteria
  1. **Completeness** — Does the plan cover ALL requirements? Any gaps?
  2. **Task Granularity** — Are tasks bite-sized (2-5 min each)? Any too large?
  3. **TDD Compliance** — Does each task follow red-green-refactor?
  4. **File Paths** — Are all file paths exact and verifiable?
  5. **Commands** — Are all commands complete with expected output?
  6. **YAGNI** — Any over-engineering or unnecessary features?
  7. **Ordering** — Are tasks in logical order? Dependencies respected?
  8. **Edge Cases** — Are error handling and edge cases covered?

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
2. Read the plan document the code implements
3. Collect test results summary

### Dispatch to Codex

Call `mcp__codex__codex`:

```
prompt: |
  Review these code changes for production readiness.

  ## What Was Implemented
  [brief description]

  ## Plan Reference
  [plan content or summary]

  ## Review Instructions
  Run these commands to see the changes:
  git diff --stat {BASE_SHA}..{HEAD_SHA}
  git diff {BASE_SHA}..{HEAD_SHA}

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
- Critical issues must be fixed before proceeding
- Important issues should be fixed before proceeding
- Minor issues are at the caller's discretion

For continued discussion, use `mcp__codex__codex-reply` with the `threadId` from the initial response.

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
