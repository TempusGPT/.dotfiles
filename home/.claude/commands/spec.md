# Create comprehensive specifications

Create comprehensive specifications for software projects including requirements, design, and task breakdown. User requirements and project description: $ARGUMENTS

## Process

1. **Codebase Exploration**

    - Analyze existing codebase structure
    - Identify relevant technologies, frameworks, and patterns
    - Understand current architecture and conventions

2. **Requirements Gathering**

    - Ask clarifying questions about:
        - Target users and use cases
        - Technical constraints and requirements
        - Performance and scalability needs
        - Integration requirements
        - Timeline and priority

3. **Requirements Document Generation**

    - Create `.claude/specs/YYMMDD-slug/` directory structure
    - Generate `requirements.md` (Product Requirements Document - PRD)
    - **Wait for user review and approval before proceeding**

4. **Design Document Generation**

    - Generate `design.md` (Technical Requirements Document - TRD)
    - **Wait for user review and approval before proceeding**

5. **Task Breakdown Generation**
    - Generate `tasks.md` (Task breakdown and implementation plan)
    - **Present final task list for user confirmation**

## Output Structure

### requirements.md (PRD)

-   Project overview and objectives
-   User stories and acceptance criteria
-   Functional and non-functional requirements
-   Success metrics

### design.md (TRD)

-   System architecture and design decisions
-   API specifications and data models
-   Technology stack and dependencies
-   Security and performance considerations

### tasks.md (Task Breakdown)

-   Jira-ticket-sized tasks (each task = one test + code review cycle)
-   Task hierarchy with subtasks when needed
-   Dependencies and execution order
-   Effort estimates and priorities

## Example Directory Structure

```
.claude/specs/250819-user-auth/
├── requirements.md
├── design.md
└── tasks.md
```

## Implementation Notes

-   Each task in tasks.md should be reviewable as a single unit
-   Tasks should be independent where possible
-   Include testing strategy for each major component
-   Consider CI/CD and deployment requirements
