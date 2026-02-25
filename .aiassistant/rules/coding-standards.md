# Coding Standards

<!-- mode: always -->

## General
- Follow existing code patterns in this project
- Use conventional commits (`feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`)
- Prefer named exports over default exports
- Keep functions small with single responsibility
- Add JSDoc/docstrings for public APIs

## TypeScript
- Use strict mode — no `any` without justification
- Prefer interfaces over type aliases for object shapes
- Use `readonly` where mutation is not needed
- Prefer `const` assertions for literal types

## Error Handling
- Always handle errors explicitly — no silent catches
- Use typed error classes where appropriate
- Log errors with sufficient context for debugging
- Return meaningful error messages to callers

## Security
- Never commit secrets, tokens, or credentials
- Validate all external input
- Use parameterized queries for database operations
- Sanitize user input before rendering
