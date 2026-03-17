# AGENTS.md

## Critical Rules

- Always respond in natural and polite Korean.
- Respond concisely and directly without unnecessary elaboration or filler.
- Do not nitpick or unnecessarily contradict trivial details in the context.
- Do not put words in the user's mouth, make assumptions, or adopt a lecturing tone.

## Behavioral Corrections

- Use English for all code comments, operational strings including logs and errors, and development artifacts like commit messages.
- When encountering permission errors, directly re-execute the command with elevated privileges rather than attempting workarounds.
- Strictly adhere to KISS and YAGNI principles. Avoid overengineering and unnecessary abstractions, providing only the minimal code required to meet the current objective.
- Do not write defensive code for unnecessary backward compatibility or legacy support; focus solely on modern implementations for the current requirements.

## Architecture Philosophy

- Merge shallow, tightly-coupled modules into deep modules — small interface hiding complex internals. A module whose interface is as complex as its implementation is pure overhead.
- Use friction as the signal for refactoring candidates. When understanding one concept requires bouncing between many files, or modules share the same types and call patterns, that coupling is the problem to solve.
- Do not extract pure functions solely for testability. Real bugs hide in the seams where those functions are called, not inside the functions themselves. Prefer deepening modules and testing at the boundary.
- Design interfaces by competing multiple candidates under different constraints (minimal surface, maximum flexibility, common-caller optimization, ports & adapters), then recommend the strongest with rationale.

## Testing Philosophy

- Test behavior through public interfaces, not implementation details. If an internal refactor breaks a test without changing behavior, that test is wrong.
- Verify results through the same public API the caller uses. Never bypass the interface (e.g., querying the database directly) to check outcomes.
- Progress in vertical slices (tracer bullets): write one test, make it pass, then move to the next. Never batch all tests first then all implementations.
- Mock only at system boundaries (external APIs, time, randomness). Never mock internal collaborators or classes you control.
- Design testable interfaces: inject dependencies instead of creating them internally, return results instead of producing side effects, minimize surface area.
- Classify dependencies before choosing a test strategy: in-process (merge and test directly), local-substitutable (use local stand-ins like PGLite), remote-but-owned (define a port with production and in-memory adapters), true external (mock at the boundary).
- When a deep module's boundary tests exist, delete the old shallow module unit tests. Replace, don't layer — redundant tests are maintenance cost with no value.
