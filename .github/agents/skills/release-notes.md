# Skill: Release Notes

Generate changelogs and release notes from commit history.

## Trigger
Invoked before releases or on-demand for a commit range.

## Process

### 1. Gather Commits
Collect all commits since the last release tag. Parse conventional commit prefixes.

### 2. Categorize
Group changes into sections:
- **Breaking Changes** — `feat!:`, `fix!:`, `BREAKING CHANGE:`
- **Features** — `feat:`
- **Bug Fixes** — `fix:`
- **Performance** — `perf:`
- **Documentation** — `docs:`
- **Internal** — `chore:`, `refactor:`, `test:`, `ci:`

### 3. Write Summary
For each entry:
- One-line description (from commit message)
- PR reference if available (`#123`)
- Breaking change migration notes if applicable

### 4. Highlight
Call out the 2-3 most impactful changes at the top as highlights.

## Output Format
```markdown
## [version] — YYYY-MM-DD

### Highlights
- Brief description of major change (#PR)

### Breaking Changes
- Description of breaking change (#PR)
  - **Migration**: steps to update

### Features
- Description (#PR)

### Bug Fixes
- Description (#PR)

### Internal
- Description (#PR)
```
