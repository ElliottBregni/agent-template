---
name: dependency-audit
description: "Guide for reviewing and updating dependencies for security, compatibility, and maintenance health. Use this when asked to audit dependencies, update packages, check for CVEs, or run npm audit."
license: MIT
---

# Skill: Dependency Audit

Review and update dependencies for security, compatibility, and maintenance health.

## Trigger
Invoked weekly, before releases, or when a CVE alert fires.

## Process

### 1. Security Scan
```bash
# Node
npm audit --audit-level=moderate

# Python
pip audit

# Ruby
bundle audit check --update

# Go
govulncheck ./...
```

### 2. Outdated Packages
```bash
# Node
npm outdated

# Python
pip list --outdated

# Ruby
bundle outdated
```

### 3. Triage Each Finding

| CVE/Package | Severity | Direct/Transitive | Fix Available | Action |
|-------------|----------|-------------------|---------------|--------|
| ... | CRITICAL | direct | yes | Update now |
| ... | HIGH | transitive | no | Assess impact |

### 4. Update Strategy

- **CRITICAL/HIGH with fix**: Update immediately, test thoroughly
- **CRITICAL/HIGH no fix**: Assess exposure, consider alternative package or mitigation
- **MEDIUM**: Include in next sprint
- **LOW**: Batch quarterly
- **Major version bumps**: Read changelog, test in isolation

### 5. Lockfile Hygiene
- Commit lockfiles (`package-lock.json`, `poetry.lock`, `Gemfile.lock`)
- Pin exact versions for production dependencies
- Use `.npmrc` `save-exact=true` or equivalent

## Output
PR or issue with: list of updated packages, CVEs resolved, breaking changes noted, test results.
