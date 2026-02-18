---
name: vibe-code
description: |
  This skill should be used when an approved implementation plan exists and needs to be executed. Trigger phrases include "execute this plan", "implement this plan", "start coding", "run the plan", "build this". Also triggered by vibe-plan after the plan is approved, or invocable directly when the user already has a plan document.
---

# Vibe Code

Execute implementation plans by dispatching a fresh vibe-implementer subagent per task. Each task must pass verification. Review after all tasks complete.

## Hard Gate

```
NO CODING WITHOUT APPROVED PLAN
NO MERGE WITHOUT APPROVED REVIEW
```

Read the plan first. Do not start coding without user confirmation. Do not merge without vibe-review approval.

## Process

### Step 1: Setup

1. Read the plan document, extract all tasks
2. Parse plan header for branch name, test/typecheck/lint commands
3. Capture BASE_SHA for later review: `BASE_SHA=$(git rev-parse HEAD)`
4. Create feature branch:
   ```bash
   git checkout -b feature/<plan-name>
   ```
5. Create TodoList with all tasks using `TaskCreate`

### Step 2: Execute Tasks Sequentially

For each task, in order:

1. **Mark in_progress** via `TaskUpdate`

2. **Dispatch vibe-implementer** — fresh subagent per task:

   ```
   Task tool (vibe-implementer):
     description: "Implement Task N: [task name]"
     prompt: |
       You are implementing Task N: [task name]

       ## Task Description
       [FULL TEXT of task from plan — paste it, don't reference file]

       ## Project Context
       - Tech stack: [from plan header]
       - Conventions: [from codebase knowledge]
       - Working directory: [absolute path]

       ## Commands
       - Test: [test command from plan]
       - Typecheck: [typecheck command from plan]
       - Lint: [lint command from plan]
   ```

3. **Handle questions** — if implementer asks questions, answer and re-dispatch

4. **Verify** — confirm implementer's reported test/typecheck/lint results. If suspicious, re-run independently.

5. **On failure** — dispatch vibe-debug:
   - 1st attempt: standard debug
   - 2nd attempt: more context, different angle
   - 3rd failure: **STOP**, escalate to user

6. **Mark completed** via `TaskUpdate`

**Critical: fresh subagent per task.** Never reuse an implementer across tasks. Context bleed causes drift.

### Step 3: Final Review

After all tasks complete:

1. Dispatch **vibe-review** (code review mode) with:
   - `BASE_SHA`: commit before first task
   - `HEAD_SHA`: current HEAD
   - Plan document content
   - Description of what was implemented

2. Process review results:
   - **APPROVED** → proceed to Step 4
   - **Critical issues** → fix immediately, re-review
   - **Important issues** → fix, re-review
   - **Minor issues** → fix at user's discretion

### Step 4: Merge

Present options to user via `AskUserQuestion`:

```
All tasks complete and review approved. How to proceed?

1. Merge to main locally — merge, run tests, delete branch
2. Push and create PR — push branch, create PR via gh
3. Keep branch as-is — leave for later
4. Discard — delete branch and all changes (requires confirmation)
```

**Option 1: Local merge**

```bash
git checkout main
git pull
git merge feature/<plan-name>
# run tests to verify
git branch -d feature/<plan-name>
```

**Option 2: Push and PR**

```bash
git push -u origin feature/<plan-name>
gh pr create --title "[title]" --body "$(cat <<'EOF'
## Summary
[2-3 bullets from plan goal]

## Plan
See `docs/plans/[plan-file].md`

## Test Plan
- [verification steps]
EOF
)"
```

**Option 3: Keep** — report branch name and location

**Option 4: Discard** — require user to type "discard" to confirm, then:

```bash
git checkout main
git branch -D feature/<plan-name>
```

## Red Flags

| Temptation                              | Reality                                                         |
| --------------------------------------- | --------------------------------------------------------------- |
| "Reuse the implementer, it has context" | Context bleed causes drift. Fresh subagent per task. Always.    |
| "Tests passed, skip the review"         | Tests verify behavior. Review verifies design. Both are needed. |
| "Minor issues, just merge"              | Read the issues. Fix Critical and Important before merge.       |
| "Start on main, branch later"           | Branch first. Uncommitted work on main is a disaster waiting.   |
| "The implementer said it passed"        | Verify independently if anything seems off. Trust but verify.   |
| "Debug attempt 4 will work"             | 3 strikes = escalate. Stale loops waste time.                   |

## Integration

**Called by:**

- vibe-plan — after plan approved
- User directly — with existing plan

**Dispatches:**

- vibe-implementer — fresh subagent per task (via Task tool)
- vibe-debug — on verification failures
- vibe-review — final code review after all tasks
