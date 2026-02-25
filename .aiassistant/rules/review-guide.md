# Code Review Guide

<!-- mode: manually -->

When reviewing code, check for:

## Correctness
- Does the code do what it claims?
- Are edge cases handled?
- Are error paths covered?

## Security
- No hardcoded secrets or credentials
- Input validation present
- SQL injection / XSS prevention
- Proper auth checks

## Performance
- No unnecessary re-renders or recomputations
- Efficient data structures and algorithms
- Database queries are indexed and optimized
- No N+1 query patterns

## Maintainability
- Clear naming — code reads like documentation
- Functions are small and focused
- No dead code or commented-out blocks
- Tests cover the changes
