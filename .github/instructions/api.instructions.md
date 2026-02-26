---
applyTo: "**/api/**,**/routes/**,**/handlers/**,**/controllers/**,**/endpoints/**"
---

When writing or modifying API code:

- Use consistent HTTP status codes: 200/201/204 success, 400 validation, 401 auth, 403 authz, 404 not found, 409 conflict, 422 unprocessable, 429 rate limited, 500 server error
- Validate all request inputs at the handler boundary — never trust client data
- Return structured error objects: `{ error: { code, message, fields? } }`
- Never expose internal error details, stack traces, or system paths in responses
- Use parameterized queries — never string-concatenate SQL
- Check authorization (resource ownership), not just authentication
- Add request logging with method, path, status code, and latency
- Document new endpoints in OpenAPI spec if one exists
