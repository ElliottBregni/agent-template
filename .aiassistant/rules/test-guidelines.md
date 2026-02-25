# Test Guidelines

<!-- mode: by_file_pattern, pattern: **/*.test.*,**/*.spec.*,**/tests/**,**/test/** -->

## Writing Tests
- Use descriptive test names that explain the expected behavior
- Follow the existing test patterns in this project
- Test edge cases and error paths, not just happy paths
- Mock external dependencies — don't make real API calls
- Keep tests focused — one assertion per concept

## Structure
- Use `describe` blocks to group related tests
- Use `beforeEach`/`afterEach` for shared setup/teardown
- Prefer factory functions over shared mutable state
- Name test files to match source: `foo.ts` → `foo.test.ts`

## Assertions
- Prefer specific matchers (`toEqual`, `toContain`) over generic (`toBeTruthy`)
- Assert on the exact expected value, not just type
- Test both positive and negative cases
