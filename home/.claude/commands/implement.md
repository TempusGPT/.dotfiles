# Implement a task from existing specifications

Execute a specific task from a specification using Test-Driven Development: $ARGUMENTS

## Command Flow

### 1. Specification Selection

Locate the specification to implement:

-   **If spec name provided in arguments**: Search for matching spec in `.claude/spec/` directory
-   **If no spec name provided**: List all available specs and ask user to select one

The spec folder follows the naming pattern: `YYMMDD-slug`

### 2. Task Selection

Select the task to implement from `tasks.md`:

-   **If task name/number provided in arguments**: Select the matching task
-   **If no task specified**: Display all tasks from the spec's `tasks.md` with their status and ask user to select one

### 3. Test-Driven Development

Before implementation, write comprehensive tests for the selected task:

-   **Unit Tests**: For individual functions and components
-   **Integration Tests**: For component interactions
-   **Edge Cases**: Handle boundary conditions and error scenarios
-   **Test Framework**: Use the project's existing test framework and patterns

Run tests to ensure they fail appropriately before implementation.

### 4. Implementation

Implement only the selected task:

-   **Follow TRD**: Adhere to the technical requirements in `design.md`
-   **Code Standards**: Match existing project conventions and patterns
-   **Single Task Focus**: Complete only the selected task, not other tasks
-   **Incremental Testing**: Run tests frequently during implementation

### 5. Verification

After implementation:

-   **All Tests Pass**: Ensure the written tests now pass
-   **Existing Tests**: Verify no regression in existing test suite
-   **Code Review**: Self-review for code quality and completeness
-   **Update Status**: Mark task as completed in `tasks.md`

## Important Notes

-   **TDD First**: Always write tests before implementation code
-   **Isolated Work**: Focus exclusively on the selected task
-   **Spec Compliance**: Implementation must match the approved specifications
-   **No Scope Creep**: Do not implement additional tasks or features
-   **Documentation**: Update inline documentation as needed
