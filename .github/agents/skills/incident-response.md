---
name: incident-response
description: "Guide for triaging, coordinating, and documenting production incidents. Use this when asked to handle an incident, alert, outage, or production issue."
license: MIT
---

# Skill: Incident Response

Triage, coordinate, and document production incidents.

## Trigger
Invoked when an alert fires, a production issue is reported, or an incident channel is opened.

## Process

### 1. Declare Severity
Assess immediately:
- SEV1: Full outage, data loss, security breach
- SEV2: Major feature broken, >10% users affected
- SEV3: Degraded, workaround exists
- SEV4: Minor, single user, cosmetic

### 2. Open an Incident
- Create GitHub issue with `incident` label
- Post in #incidents: `🚨 [SEV] INCIDENT — [title] | IC: @name | Status: INVESTIGATING`

### 3. Mitigate First
In order of speed:
1. Rollback last deploy
2. Flip feature flag off
3. Scale up resources
4. Redirect traffic

### 4. Investigate in Parallel
- Check recent deploys and config changes
- Check error rates, latency, saturation in dashboards
- Search logs for error spikes

### 5. Resolve and Communicate
- Post resolution in #incidents with: what happened, impact, what was done
- Update GitHub issue to RESOLVED

### 6. Schedule Postmortem
- Within 48h for SEV1/2
- Optional for SEV3

## Output
GitHub issue with incident template filled, timeline, and action items.
