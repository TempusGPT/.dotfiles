---
name: vibe-plan
description: |
  This skill should be used when requirements exist and an implementation plan needs to be written before coding. Trigger phrases include "write a plan", "create implementation plan", "plan this feature", "break this into tasks". Also triggered by vibe-spec after requirements are approved, or invocable directly when the user already has confirmed requirements.
---

# Vibe Plan

Write comprehensive implementation plans from requirements. Plans are so detailed that a fresh subagent can execute each task with zero additional context.

## Hard Gate

```
NO PLAN WITHOUT REQUIREMENTS
NO CODE WITHOUT APPROVED PLAN
```

Confirm requirements are agreed upon before writing. Do not invoke vibe-code until the plan is reviewed and the user approves.

## Tool Restrictions

NEVER use the ExitPlanMode or EnterPlanMode tools.
This skill has nothing to do with Claude Code's built-in plan mode.
Vibe-plan manages its own workflow — writing a plan document, not entering/exiting a mode.

## Plan Document Format

Save to: `docs/plans/YYYY-MM-DD-<feature>.md`

```markdown
# [Feature Name] Implementation Plan

> **For Claude:** Use vibe-code to implement this plan task-by-task.

**Goal:** [one sentence]
**Requirements:** [summarized from vibe-spec conversation or user input]
**Architecture:** [2-3 sentences on approach]
**Tech Stack:** [key technologies]
**Branch:** `feature/<feature-name>`

**Commands:**

- Test: `[test command]`
- Typecheck: `[typecheck command or N/A]`
- Lint: `[lint command or N/A]`

---

### Task 1: [Component Name]

**Files:**

- Create: `exact/path/to/file.ts`
- Modify: `exact/path/to/existing.ts` (lines 123-145)
- Test: `tests/exact/path/to/test.ts`

**What to build:**
[exact implementation details — code, logic, interfaces]

**What to test:**
[exact test cases — inputs, expected outputs, edge cases]

**Acceptance criteria:**
[how to verify this task is done]

---

### Task 2: ...
```

## Task Granularity

Each task = one logical unit a subagent can complete independently.

Each step within a task = one action:

- "Write the failing test" — one step
- "Run to verify it fails" — one step
- "Implement minimal code" — one step
- "Run verifications" — one step
- "Commit" — one step

## Process

### Step 1: Confirm Requirements

Requirements come from the vibe-spec conversation (not a saved file). If requirements have not been confirmed by the user, stop and invoke vibe-spec first.

### Step 2: Explore Codebase

Dispatch **vibe-explorer** (depth: deep) focused on areas the implementation will touch:

```
Task tool (vibe-explorer):
  description: "Deep explore for [feature] implementation"
  prompt: |
    Explore the codebase deeply for implementing [feature].
    Depth: deep
    Focus: [specific areas from requirements]
    Purpose: Gather exact file paths, naming conventions, test patterns,
    and existing code to reference in the implementation plan.
```

### Step 3: Research (If Needed)

Dispatch **vibe-researcher** for unresolved technical questions from the agreed requirements.

### Step 4: Write Plan

Save plan document to `docs/plans/YYYY-MM-DD-<feature>.md` (create directory if needed).
Follow the Plan Document Format above. For every task:

- **Exact file paths** — no "somewhere in src/"
- **Complete code** — no "add appropriate validation"
- **Clear acceptance criteria** — no "should work"

### Step 5: Review

1. Invoke vibe-review skill (plan review mode) — call Codex, get verdict + threadId
2. If NEEDS CHANGES: fix issues, re-review via codex-reply with same threadId
3. Repeat until APPROVED
4. Present plan to user for final approval
5. If user requests changes: apply changes, re-review via codex-reply

### Step 6: Create Feature Branch and Commit

1. Create feature branch: `git checkout -b feature/<feature-name>`
2. Commit plan: `git add docs/plans/... && git commit -m "docs: add <feature> implementation plan"`
3. Verify: `git log -1` shows the plan commit on the feature branch

### Step 7: Handoff

Transition: "Plan approved and committed on `feature/<feature-name>`. Invoke vibe-code to start implementation?"

## Red Flags

| Temptation                              | Reality                                                          |
| --------------------------------------- | ---------------------------------------------------------------- |
| "The task is obvious, skip the details" | A fresh subagent has zero context. Be explicit.                  |
| "Add appropriate error handling"        | Write the actual error handling code in the plan.                |
| "Run the tests"                         | Which test command? Which test file? What's the expected output? |
| "Modify the config"                     | Which file, which lines, what exact changes?                     |
| "This is too detailed"                  | Detailed plans = fast execution. Vague plans = rework.           |
| "Skip vibe-review, the plan looks fine" | Self-review misses what independent review catches.              |

## Integration

**Called by:**

- vibe-spec — after requirements approved
- User directly — with confirmed requirements

**Dispatches:**

- vibe-explorer — deep codebase analysis for planning (subagent via Task tool)
- vibe-researcher — tech research for planning (subagent via Task tool)

**Invokes:**

- vibe-review — plan review before approval (skill via Skill tool)

**Transitions to:**

- vibe-code — after plan is approved
