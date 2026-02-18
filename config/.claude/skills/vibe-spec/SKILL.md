---
name: vibe-spec
description: |
  This skill should be used when starting any new feature, project, or significant change that needs requirements definition. Trigger phrases include "new feature", "I want to build", "let's brainstorm", "define requirements", "spec this out", "I have an idea". Also invocable as the entry point of the vibe workflow: vibe-spec -> vibe-plan -> vibe-code.
---

# Vibe Spec

Turn ideas into refined requirements through interactive brainstorming. Explore the codebase and research technologies before asking questions, so questions are informed and precise.

## Hard Gate

```
NO IMPLEMENTATION WITHOUT APPROVED REQUIREMENTS
```

Do not invoke vibe-plan, vibe-code, or write any production code until the requirements document is written and the user approves it.

## Process

### Phase 1: Context Gathering

Dispatch **vibe-explorer** subagent (depth: medium) to understand the project before asking questions:

```
Task tool (vibe-explorer):
  description: "Explore codebase for [topic] context"
  prompt: |
    Explore the codebase to understand the architecture relevant to [user's idea].
    Depth: medium
    Focus: [area related to the idea]
    Purpose: Inform requirements brainstorming — identify existing patterns,
    related features, and constraints.
```

Wait for results before proceeding to Phase 2.

### Phase 2: Interactive Brainstorming

Ask the user clarifying questions to refine the idea into concrete requirements.

**Rules:**

- **One question at a time** — never overwhelm with multiple questions
- **Multiple choice preferred** — use `AskUserQuestion` with concrete options when possible
- **Informed by Phase 1** — reference what was found in the codebase
- **YAGNI ruthlessly** — challenge scope creep, suggest removing unnecessary features

**Question sequence:**

1. **Purpose** — What problem does this solve? Who benefits?
2. **Scope** — What is included? What is explicitly excluded?
3. **Behavior** — What should it do? What are the key user flows?
4. **Constraints** — Performance, security, compatibility, deadline?
5. **Success criteria** — How do we know it's done and working?

### Phase 3: Research (If Needed)

If tech decisions are involved (library choice, API design, architecture pattern), dispatch **vibe-researcher** subagent:

```
Task tool (vibe-researcher):
  description: "Research [topic] for requirements"
  prompt: |
    Research [specific question] for a project using [tech stack].
    Context: [what we're building and why]
    Comparison criteria: [what matters — performance, API design, bundle size, etc.]
```

Present findings to the user before making tech decisions.

### Phase 4: Approaches

Propose **2-3 approaches** with trade-offs:

```markdown
## Approach A: [Name] (Recommended)

- **How:** [brief description]
- **Pros:** [advantages]
- **Cons:** [disadvantages]
- **Effort:** [relative estimate: small/medium/large]

## Approach B: [Name]

- ...
```

Lead with the recommended option and explain why. Get the user's choice before proceeding.

### Phase 5: Requirements Document

Present the document **section by section**, getting approval after each:

1. **Goal** — one sentence
2. **Scope** — what is and is NOT included
3. **Requirements** — numbered, each testable and verifiable
4. **Non-functional requirements** — performance, security, accessibility
5. **Tech decisions** — chosen libraries/patterns with rationale
6. **Success criteria** — how to verify the feature works end-to-end

### Phase 6: Handoff

1. Save to `docs/plans/YYYY-MM-DD-<topic>-requirements.md` (create `docs/plans/` if needed)
2. Commit: `git add docs/plans/... && git commit -m "docs: add <topic> requirements"`
3. Transition: "Requirements approved. Invoke vibe-plan to create the implementation plan?"

## Key Principles

| Principle                 | In Practice                                                 |
| ------------------------- | ----------------------------------------------------------- |
| One question at a time    | Never batch questions. Wait for answer before next.         |
| Multiple choice preferred | Use `AskUserQuestion` with 2-4 concrete options.            |
| YAGNI ruthlessly          | "Do we actually need this for v1?" Challenge every feature. |
| Explore before asking     | Dispatch vibe-explorer first. Ask informed questions.       |
| Incremental validation    | Present requirements section by section, not all at once.   |
| Research before deciding  | Dispatch vibe-researcher for tech decisions. Don't guess.   |

## Integration

**Dispatches:**

- vibe-explorer — codebase analysis before brainstorming
- vibe-researcher — tech research when decisions are needed

**Transitions to:**

- vibe-plan — after requirements are approved
