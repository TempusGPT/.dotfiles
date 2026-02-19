---
name: vibe-code
description: |
  This skill should be used when an approved implementation plan exists and needs to be executed. Trigger phrases include "execute this plan", "implement this plan", "start coding", "run the plan", "build this". Also triggered by vibe-plan after the plan is approved, or invocable directly when the user already has a plan document.
---

# Vibe Code

Execute implementation plans by dispatching a fresh vibe-implementer subagent per task. Each task must pass verification. Review after all tasks complete.

## Hard Gate

```
NO MERGE WITHOUT APPROVED REVIEW
```

Do not merge without vibe-review approval.

## Process

### Step 1: Setup

1. Read the plan document, extract all tasks
2. Parse plan header for branch name, test/typecheck/lint commands
3. Verify on the correct feature branch: `git branch --show-current`
   - If on feature branch with plan commit → proceed
   - If on main → check out the feature branch from plan
   - If no feature branch exists → ask user where the plan is
4. Create TodoList with all tasks using `TaskCreate`

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

       ## Commands
       - Test: [test command from plan]
       - Typecheck: [typecheck command from plan]
       - Lint: [lint command from plan]
   ```

3. **Handle questions** — if implementer asks questions, answer and re-dispatch

4. **Verify** — confirm implementer's reported test/typecheck/lint results. If suspicious, re-run independently.

5. **On implementer escalation** — the implementer handles debug internally (self-fix 2 strikes → vibe-debug up to 2 attempts). If it escalates:
   - Review the escalation report (self-fix attempts + debug attempts)
   - Present findings to user with recommended next steps
   - **Do not re-dispatch debug yourself** — the implementer already exhausted debug options

6. **Mark completed** via `TaskUpdate`

**Critical: fresh subagent per task.** Never reuse an implementer across tasks. Context bleed causes drift.

### Step 3: Final Review

After all tasks complete:

1. Invoke vibe-review skill (code review mode) with plan path. Gets verdict + threadId.
2. Process results:
   - **APPROVED** → proceed to Step 4
   - **NEEDS CHANGES** → dispatch new vibe-implementer with review issues as task,
     then re-review via codex-reply with same threadId. Repeat until APPROVED.

When NEEDS CHANGES, dispatch a new vibe-implementer:

```
Task tool (vibe-implementer):
  description: "Fix code review issues"
  prompt: |
    You are fixing issues found during final code review.

    ## Issues to Fix
    [Paste the NEEDS CHANGES section from Codex review — issues only]

    ## Project Context

    ## Commands
    - Test: [test command]
    - Typecheck: [typecheck command]
    - Lint: [lint command]

    Fix all issues listed above. Do not modify anything else.
```

### Step 4: Merge

Present merge options to user via `AskUserQuestion`.

If user requests changes instead of choosing an option:

1. Dispatch new vibe-implementer with user's change request
2. Re-review via codex-reply with same threadId from Step 3
3. APPROVED → present merge options again

Options:

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

| Temptation                              | Reality                                                            |
| --------------------------------------- | ------------------------------------------------------------------ |
| "Reuse the implementer, it has context" | Context bleed causes drift. Fresh subagent per task. Always.       |
| "Tests passed, skip the review"         | Tests verify behavior. Review verifies design. Both are needed.    |
| "Start on main, branch later"           | Branch first. Uncommitted work on main is a disaster waiting.      |
| "The implementer said it passed"        | Verify independently if anything seems off. Trust but verify.      |
| "Let me fix the review issues myself"   | Delegate to vibe-implementer. Main agent stays clean.              |
| "One more debug attempt will work"      | Implementer already tried 2 self-fixes + 2 debug rounds. Escalate. |

## Integration

**Called by:**

- vibe-plan — after plan approved
- User directly — with existing plan

**Dispatches:**

- vibe-implementer — fresh subagent per task (via Task tool). Implementer handles debug internally via vibe-debug skill.

**Invokes:**

- vibe-review — final code review after all tasks (skill via Skill tool)
