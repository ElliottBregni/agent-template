# Skill: Test Generation

Write comprehensive tests for files, functions, or components.

## Trigger
Invoked when test coverage is needed for new or changed code.

## Rules
- Match the existing test framework and patterns in the project
- Use descriptive test names that explain expected behavior
- Cover happy paths, edge cases, and error paths
- Mock external dependencies — no real API calls, no real DB hits
- Keep tests focused — one assertion per concept
- Name test files to match source: `foo.ts` → `foo.test.ts`

## Structure
```
describe('ModuleName', () => {
  describe('functionName', () => {
    it('should [expected behavior] when [condition]', () => {
      // Arrange
      // Act
      // Assert
    });
  });
});
```

## Coverage Targets
For each function/component, generate tests for:
1. **Happy path** — normal expected input and output
2. **Edge cases** — empty input, boundary values, large data
3. **Error cases** — invalid input, network failures, timeouts
4. **Type safety** — null/undefined handling, type coercion
5. **Integration** — interaction with adjacent modules (if applicable)

## Output
- Test file with imports, mocks, and test cases
- Brief comment explaining what each test group covers
- Flag any untestable code and suggest refactoring
