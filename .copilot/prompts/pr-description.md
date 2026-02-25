# Prompt: PR Description

Generate a pull request description from the diff and commit history.

## Input
- Commit messages since branch diverged from base
- File diff summary (files changed, insertions, deletions)
- Related issue numbers (if any)

## Output Format
```markdown
## Summary
[1-3 bullet points describing what changed and why]

## Changes
- [file/module]: [what changed]
- [file/module]: [what changed]

## Testing
- [ ] Unit tests added/updated
- [ ] Manual testing performed
- [ ] Edge cases covered

## Related
- Closes #[issue]
- Depends on #[pr]
```

## Rules
- Lead with the "why", not the "what"
- Keep summary under 3 bullet points
- Group related file changes together
- Flag breaking changes prominently
- Link related issues and PRs
