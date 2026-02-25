# Prompt: Summary

Generate daily or weekly development summaries.

## Input
- Commit log for the time period
- PRs merged
- Issues opened/closed
- Deployment events

## Output Format

### Daily Summary
```markdown
## [Date] — Daily Summary

### Shipped
- [feature/fix]: [one-line description] (#PR)

### In Progress
- [feature]: [status, blockers if any] (#PR)

### Issues
- [count] opened, [count] closed, [count] in triage

### Deploys
- [environment]: [version] at [time]
```

### Weekly Summary
```markdown
## Week of [date range]

### Highlights
- [2-3 most impactful changes]

### Metrics
- PRs merged: [count]
- Issues closed: [count]
- Deploys: [count]
- Avg PR cycle time: [duration]

### By Area
- **Frontend**: [summary]
- **Backend**: [summary]
- **Infra**: [summary]

### Next Week
- [planned work or priorities]
```

## Rules
- Lead with what shipped, not what's in progress
- Quantify where possible
- Flag blockers and risks explicitly
- Keep it scannable — bullets over paragraphs
