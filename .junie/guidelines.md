# {{PROJECT_NAME}} — Junie Guidelines

## Project
- **Stack**: {{STACK}}
- **Repo**: {{REPO_URL}}

## Conventions
- Follow existing code patterns and style
- Write tests for new functionality
- Keep changes focused and small
- Use conventional commits (`feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`)

## Code Style
- Prefer named exports over default exports
- Use TypeScript strict mode where applicable
- Keep functions small — single responsibility
- Add JSDoc/docstrings for public APIs

## Testing
- Write tests for all new features and bug fixes
- Mock external dependencies, don't make real API calls
- Test edge cases and error paths, not just happy paths
- Use descriptive test names that explain the expected behavior

## Architecture
<!-- Describe key architectural decisions, patterns, and boundaries -->

## Key Paths
<!-- List important directories and files -->

## Do NOT
- Commit secrets, tokens, or credentials
- Skip tests or disable linting
- Make unrelated changes in a focused PR
- Use `any` type in TypeScript without justification
