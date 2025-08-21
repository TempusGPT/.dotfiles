# Create comprehensive specifications from user stories

Generate Product Requirements Document (PRD), Technical Requirements Document (TRD), and task breakdown for a user story: $ARGUMENTS

## Command Flow

### 1. Codebase Exploration

First, explore the codebase to understand the context and existing patterns related to the user story. This includes:

-   Analyzing project structure and architecture
-   Identifying relevant existing components and systems
-   Understanding coding conventions and patterns
-   Reviewing similar implementations if they exist

### 2. Requirements Gathering

Ask clarifying questions one at a time to ensure full understanding of requirements. Questions may cover:

-   Business objectives and success criteria
-   User personas and use cases
-   Functional and non-functional requirements
-   Constraints and dependencies
-   Expected scope and boundaries

### 3. Product Requirements Document (PRD)

After gathering requirements, create a PRD at `.claude/spec/YYMMDD-slug/requirements.md` containing:

-   **Executive Summary**: Brief overview of the feature
-   **Problem Statement**: What problem is being solved
-   **User Stories**: Detailed user scenarios and acceptance criteria
-   **Functional Requirements**: What the system must do
-   **Non-Functional Requirements**: Performance, security, usability standards
-   **Success Metrics**: How success will be measured
-   **Out of Scope**: What is explicitly not being built

**User Approval Required**: Review the PRD and confirm it accurately captures the requirements before proceeding.

### 4. Technical Requirements Document (TRD)

Upon PRD approval, create a TRD at `.claude/spec/YYMMDD-slug/design.md` containing:

-   **Architecture Overview**: High-level system design
-   **Component Design**: Detailed component specifications
-   **Data Models**: Database schemas and data structures
-   **API Specifications**: Endpoints, contracts, and integrations
-   **Security Considerations**: Authentication, authorization, data protection
-   **Performance Requirements**: Latency, throughput, scalability targets
-   **Technology Stack**: Languages, frameworks, libraries to use
-   **Integration Points**: How this fits with existing systems

**User Approval Required**: Review the TRD and confirm the technical approach before proceeding.

### 5. Task Breakdown

After TRD approval, create a task breakdown at `.claude/spec/YYMMDD-slug/tasks.md` containing:

-   **Milestone Overview**: Major phases of implementation
-   **Individual Tasks**: Each task will be:
    -   **Appropriately Sized**: Completable in 2-4 hours of focused work
    -   **Self-Contained**: Can be tested, reviewed, and committed independently
    -   **Well-Defined**: Clear acceptance criteria and deliverables
    -   **Sequenced**: Proper dependencies and ordering

**User Approval Required**: Review the task breakdown to ensure it aligns with expectations and timeline.

## Important Notes

-   **Flexibility**: The process can be adapted based on the complexity and nature of the user story
-   **Testing Strategy**: Testing methods will be determined during the implementation phase based on the specific requirements of each task
-   **Iterative Process**: Each stage requires user approval before proceeding to ensure alignment
-   **Documentation Path**: All specifications will be saved in `.claude/spec/YYMMDD-slug/` where:
    -   `YYMMDD` is the current date
    -   `slug` is a URL-friendly version of the user story title
