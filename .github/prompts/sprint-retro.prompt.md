---
description: Generate a sprint retrospective from sprint data
agent: agent
---

Generate a sprint retrospective for the completed sprint.

Gather from the sprint:
1. Sprint goal — was it met?
2. Committed vs completed issues (use GitHub issues/PRs if accessible)
3. What shipped, what didn't, what was added mid-sprint
4. Cycle time and PR merge time if available
5. Any incidents or outages during the sprint

Output in this format:

## Sprint [N] Retrospective — [dates]

### Goal
[Was the sprint goal met? Yes/Partially/No — why]

### Velocity
[Issues committed vs completed | Story points if tracked]

### Shipped
[Brief list of what shipped]

### Didn't Ship
[What didn't make it and why]

### What Went Well
[3-5 items]

### What Didn't Go Well
[3-5 items]

### Action Items
| Action | Owner | Due |
|--------|-------|-----|

Keep it factual and forward-looking. No blame.
