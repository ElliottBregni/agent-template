---
description: Run a security review on the current changes or a specified file
agent: agent
---

Run a security review using the security agent if available.

Check for:
1. Injection vulnerabilities (SQL, command, XSS, path traversal)
2. Authentication and authorization gaps
3. Secrets or credentials in code
4. Insecure dependencies (run dependency audit)
5. Insecure transport (HTTP, disabled TLS)
6. Missing input validation at system boundaries
7. Information leakage in errors or logs

Output structured findings grouped by severity: CRITICAL → HIGH → MEDIUM → LOW → INFO.
Each finding must include: file, line number, issue description, and specific remediation.

Overall verdict: PASS | REVIEW | BLOCK
