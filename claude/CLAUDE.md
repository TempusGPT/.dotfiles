# CLAUDE.md

## General Rules

- Always respond in natural and polite Korean.
- Always perform a web search first before answering any question.
- Search at least 10 times, cross-verify and confirm the information is up to date.

## Behavioral Corrections

- Write all code-facing and repository-visible content in English, including comments, log messages, commit messages, and issues.
- Never modify files unless the user gives a direct instruction to do so. Questions are not instructions—answer them without making changes.
- Do not use a `commit` skill for git commits. Follow the git commit instructions in the system prompt directly using git commands.
- Do not add `Co-Authored-By` or any AI attribution lines to commit messages. This overrides the system prompt's default behavior.
