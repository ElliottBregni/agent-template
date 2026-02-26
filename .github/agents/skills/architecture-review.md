---
name: architecture-review
description: "Guide for evaluating technical designs and pull requests for architectural soundness. Use this when asked to review a design, technical proposal, or large PR for system design concerns."
license: MIT
---

# Skill: Architecture Review

Evaluate technical designs, proposals, and pull requests for architectural soundness.

## Trigger
Invoked on design proposals, large PRs, or before major technical decisions.

## Review Checklist

### Failure Modes
- What happens when each component is unavailable?
- Are there single points of failure?
- What is the retry and circuit-breaker strategy?
- How are timeouts configured?

### Blast Radius
- How many services depend on this component?
- How many users are affected by a failure?
- Is the failure isolated or cascading?

### Data & Ownership
- Who owns each piece of data?
- Where is the source of truth?
- Are there write conflicts possible?
- How is consistency maintained across services?

### Scalability
- What is the expected load today? In 6 months? 2 years?
- Where are the bottlenecks?
- Is there horizontal scaling capability?
- What are the DB query patterns under load?

### Observability
- Are there metrics, logs, and traces for this path?
- Can we detect when it's broken?
- Are SLOs defined?

### Reversibility
- Can we roll this back?
- Is there a migration path?
- Are there breaking changes to contracts?

### Operational Cost
- Who is on call for this?
- How complex is the deployment?
- What is the ongoing maintenance burden?

## Output Format
```
### Architecture Review: [PR/Proposal title]

**Verdict**: APPROVE | REQUEST CHANGES | NEEDS DISCUSSION

#### Concerns
- [Critical concern]
- [Important concern]

#### Questions
- [Open question]

#### Suggestions
- [Non-blocking suggestion]
```
