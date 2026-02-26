---
name: sprint-planning
description: "Guide for preparing, sizing, and sequencing work for sprint planning. Use this when asked to plan a sprint, size issues, groom a backlog, or calculate team capacity."
license: MIT
---

# Skill: Sprint Planning

Prepare, size, and sequence work for sprint planning sessions.

## Trigger
Invoked before sprint kickoff, during backlog grooming, or when sizing issues.

## Sprint Preparation Checklist

### Before Planning
- [ ] All P0/P1 bugs addressed or on deck
- [ ] Issues for sprint have acceptance criteria
- [ ] Dependencies between issues are mapped
- [ ] Issues are sized (XS/S/M/L/XL)
- [ ] Nothing is XL — break down or timebox

### Sizing Guide
| Size | Effort | Description |
|------|--------|-------------|
| XS | < 1 day | Tiny change, well-understood |
| S | 1-2 days | Clear scope, minimal unknowns |
| M | 3-5 days | Moderate complexity, some unknowns |
| L | 1-2 weeks | Complex, needs breakdown before starting |
| XL | > 2 weeks | Must be broken down before sprint |

### Capacity Calculation
- Team capacity: [engineers] × [sprint days] × 0.7 (70% productive time)
- Reserve: 20% for bugs, unplanned work, reviews
- Planned: remaining 80%

## Sprint Plan Output

```markdown
## Sprint [number] — [dates]

### Goal
[One sentence: what does the team ship this sprint?]

### Capacity
[N engineers × N days = N days total | 80% planned = N days]

### Committed Work
| Issue | Title | Size | Owner | Dependencies |
|-------|-------|------|-------|--------------|
| #123 | ... | S | @name | none |

### Stretch
| Issue | Title | Size | Rationale |
|-------|-------|------|-----------|

### Known Risks
- [Risk and mitigation]

### Definition of Done
- [ ] Code reviewed and merged
- [ ] Tests passing in CI
- [ ] Deployed to staging
- [ ] Acceptance criteria verified
- [ ] Docs updated if needed
```

## Rules
- No XL items in a sprint — break them down first
- Every committed issue has an owner
- Identify blockers before the sprint starts, not during
- Leave buffer — unplanned work always happens
