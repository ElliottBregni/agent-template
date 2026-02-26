---
applyTo: "**"
---

Security requirements that apply to all code:

- Never hardcode secrets, tokens, API keys, or passwords — use environment variables
- Never log sensitive data: passwords, tokens, PII, payment info
- Validate and sanitize all inputs from users, external APIs, and file uploads
- Use parameterized queries or ORMs — no raw string SQL concatenation
- Escape user content before rendering in HTML templates
- Set Secure + HttpOnly + SameSite on cookies with sensitive data
- Reject or sanitize file paths from user input to prevent path traversal
- Never disable TLS verification in HTTP clients
- Use `crypto.randomBytes` or equivalent for token generation — not `Math.random()`
- Flag any use of `eval()`, `exec()`, or `Function()` with user-supplied content for review
