---
name: api-design
description: "Guide for designing and reviewing REST and GraphQL APIs for consistency, usability, and safety. Use this when asked to design an API, review API conventions, write an OpenAPI spec, or evaluate breaking changes."
license: MIT
---

# Skill: API Design

Design and review REST and GraphQL APIs for consistency, usability, and safety.

## Trigger
Invoked when designing new endpoints, reviewing API PRs, or writing OpenAPI specs.

## REST API Conventions

### Resource Naming
- Plural nouns: `/users`, `/orders`, not `/user`, `/getOrder`
- Hierarchical for ownership: `/users/{id}/orders`
- No verbs in path: actions are HTTP methods
- Kebab-case for multi-word: `/billing-accounts`

### HTTP Methods
| Method | Use | Idempotent | Body |
|--------|-----|------------|------|
| GET | Read | Yes | No |
| POST | Create | No | Yes |
| PUT | Full replace | Yes | Yes |
| PATCH | Partial update | No | Yes |
| DELETE | Remove | Yes | No |

### Status Codes
| Code | Meaning |
|------|---------|
| 200 | Success with body |
| 201 | Created |
| 204 | Success, no body |
| 400 | Client error (invalid input) |
| 401 | Unauthenticated |
| 403 | Unauthorized |
| 404 | Not found |
| 409 | Conflict |
| 422 | Validation error |
| 429 | Rate limited |
| 500 | Server error |

### Response Shape
```json
{
  "data": { ... },
  "meta": { "total": 100, "page": 1 },
  "error": null
}
```

Error response:
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Email is required",
    "fields": { "email": "required" }
  }
}
```

### Pagination
Prefer cursor-based for large datasets:
```json
{
  "data": [...],
  "meta": {
    "cursor": "eyJpZCI6MTIzfQ==",
    "hasMore": true
  }
}
```

### Versioning
- URL versioning: `/v1/users` (simple, explicit)
- Header versioning: `API-Version: 2024-01` (Stripe-style)
- Choose one and document it

## Breaking vs Non-Breaking Changes

**Non-breaking (safe to ship)**:
- Add optional request field
- Add response field
- Add new endpoint
- Add new enum value (if consumers ignore unknowns)

**Breaking (requires version bump or transition period)**:
- Remove or rename field
- Change field type
- Change required/optional
- Change authentication method
- Remove endpoint

## Output
OpenAPI/AsyncAPI spec draft or structured review with specific endpoint feedback.
