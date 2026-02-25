# Skill: Issue Triage

Label, prioritize, and route incoming issues.

## Trigger
Invoked when new issues are opened or when triaging a backlog.

## Process

### 1. Classify Type
- `bug` — something is broken
- `feature` — new capability request
- `enhancement` — improvement to existing feature
- `docs` — documentation gap or error
- `question` — needs clarification, not a code change
- `chore` — maintenance, dependency updates, cleanup

### 2. Assess Priority
- `P0 critical` — production broken, data loss, security vulnerability
- `P1 high` — major feature broken, blocking multiple users
- `P2 medium` — noticeable issue, workaround exists
- `P3 low` — minor issue, cosmetic, nice-to-have

### 3. Identify Area
Map to project areas based on file paths, components, or keywords:
<!-- Customize these to your project -->
- `frontend` — UI components, pages, styles
- `backend` — API routes, services, middleware
- `infra` — deployment, CI/CD, config
- `data` — database, migrations, queries

### 4. Route
Suggest assignee or team based on area and expertise.

## Output Format
```
Type: bug
Priority: P2 medium
Area: backend
Labels: bug, backend, needs-investigation
Summary: [one-line description of the issue]
Next step: [suggested action]
```
