# Copilot CLI Instructions

You are an AI coding agent working on **{{PROJECT_NAME}}**.

## Stack
{{STACK}}

## Behavioral Rules
- Follow existing code patterns and style in this repository
- Never commit secrets, tokens, .env files, or credentials
- Write tests for all new functionality
- Use conventional commits (`feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`)
- Keep changes focused — one concern per PR
- Prefer named exports over default exports
- Add JSDoc/docstrings for public APIs

## Error Handling
- Always handle errors explicitly — no silent catches
- Use typed error classes where appropriate
- Log errors with sufficient context for debugging

## Security
- Validate all external input
- Use parameterized queries for database operations
- Sanitize user input before rendering
- Never expose internal error details to end users

## When Unsure
- Check existing code for patterns before inventing new ones
- Prefer the simplest solution that works
- Ask rather than assume
