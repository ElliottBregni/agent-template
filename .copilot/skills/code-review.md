# Skill: Code Review

Review pull requests and staged changes for quality, security, and correctness.

## Trigger
Invoked on PR review requests or pre-commit checks.

## Checklist

### Correctness
- Does the code do what it claims?
- Are edge cases handled?
- Are error paths covered?
- Are return types correct?

### Security
- No hardcoded secrets or credentials
- Input validation present on all boundaries
- SQL injection / XSS prevention
- Proper auth checks on protected routes
- No sensitive data in logs or error messages

### Performance
- No unnecessary re-renders or recomputations
- Efficient data structures and algorithms
- Database queries are indexed and optimized
- No N+1 query patterns
- No unbounded data fetches

### Style
- Clear naming — code reads like documentation
- Functions are small and focused (single responsibility)
- No dead code or commented-out blocks
- Consistent with existing project patterns

### Tests
- Changes are covered by tests
- Edge cases and error paths tested
- Mocks used for external dependencies

## Output Format
Group findings by severity: **critical**, **warning**, **suggestion**.
Include file path and line reference for each finding.
Rate overall: `pass`, `warn`, or `block`.
Keep it concise — no praise, just findings.
