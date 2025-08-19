# Implement a single task

Implement a single task from the specification with complete testing and validation. Specification to implement: $ARGUMENTS

## Process

1. **Specification Review**

    - Search for specification documents in `.claude/specs/` directory
    - Look for the most recent or relevant spec folder (YYMMDD-slug format)
    - Read requirements.md for project context and objectives
    - Review design.md for architecture and technical specifications
    - Find and analyze tasks.md to identify the specific task to implement
    - Understand task dependencies and prerequisites

2. **Task Analysis**

    - Parse and understand the specific task requirements
    - Identify scope, acceptance criteria, and deliverables
    - Review any subtasks or related dependencies
    - Clarify implementation approach based on design specifications

3. **Codebase Exploration**

    - Analyze existing codebase structure and patterns
    - Identify relevant files, components, and dependencies
    - Understand current architecture and conventions
    - Review similar implementations for consistency

4. **Test-Driven Implementation**

    - Write comprehensive tests first (TDD approach)
    - Implement the feature/fix to pass all tests
    - Ensure edge cases and error scenarios are covered
    - Follow existing testing patterns and frameworks

5. **Code Implementation**

    - Follow existing code style and conventions
    - Implement minimal viable solution that meets requirements
    - Add proper error handling and validation
    - Include necessary documentation and comments

6. **Validation & Quality Assurance**

    - Run all tests to ensure they pass
    - Execute lint and typecheck commands
    - Verify no regressions in existing functionality
    - Check integration with existing systems

7. **Task Completion**
    - Update task status to "completed" in tasks.md (if applicable)
    - Summarize what was implemented
    - Note any deviations from original specification
    - Identify any follow-up tasks or dependencies

## Implementation Guidelines

-   **Single Responsibility**: Implement only the specified task
-   **Test Coverage**: Ensure comprehensive test coverage
-   **Code Quality**: Follow linting and type-checking standards
-   **Documentation**: Update relevant documentation
-   **Error Handling**: Include proper error handling and validation
-   **Integration**: Ensure smooth integration with existing code

## Quality Checks

Before marking task as complete:

-   [ ] All new tests pass
-   [ ] All existing tests still pass
-   [ ] Lint checks pass
-   [ ] Type checks pass (if applicable)
-   [ ] Manual testing completed
-   [ ] Code follows project conventions
-   [ ] Documentation updated (if needed)

## Task Status Update

If implementing from a tasks.md file:

-   Mark task as "In Progress" when starting
-   Mark task as "Completed" when all quality checks pass
-   Add implementation notes and any discovered issues
