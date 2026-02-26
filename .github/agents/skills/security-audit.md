---
name: security-audit
description: "Guide for auditing code changes for security vulnerabilities. Use this when asked to review security, check for OWASP issues, find vulnerabilities, or audit code for injection, auth, or secrets exposure."
license: MIT
---

# Skill: Security Audit

Audit code changes and files for security vulnerabilities.

## Trigger
Invoked on PR review, pre-deploy checks, or on-demand security sweeps.

## Checklist

### Injection Vectors
- SQL: string concatenation in queries → use parameterized queries
- Command: user input in exec/shell calls → sanitize or avoid
- XSS: unescaped user content in HTML → escape or use safe APIs
- Path traversal: user-controlled file paths → validate and normalize

### Authentication
- Are all routes protected that should be?
- Are session tokens rotated after privilege change?
- Are failed auth attempts rate-limited?
- Are tokens stored securely (httpOnly cookies, not localStorage for sensitive apps)?

### Authorization
- Is resource ownership checked, not just authentication?
- Are there IDOR vulnerabilities (access by ID without ownership check)?
- Are admin routes protected server-side?

### Secrets
- No hardcoded secrets in source code
- No secrets in logs or error responses
- Secrets loaded from environment, not config files committed to git

### Dependencies
- Run: `npm audit` / `pip audit` / `bundle audit`
- Check for unpinned major versions
- Flag packages with no recent updates on critical paths

### Transport
- All external calls use HTTPS
- Certificates validated (no `verify=False` or `rejectUnauthorized: false`)
- Sensitive cookies have Secure + HttpOnly + SameSite

## Output
Findings grouped by: CRITICAL → HIGH → MEDIUM → LOW → INFO
Each finding: file, line, issue, remediation.
