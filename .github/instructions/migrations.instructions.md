---
applyTo: "**/migrations/**,**/db/migrate/**,**/*.migration.*,**/schema/**"
---

When writing or reviewing database migrations:

- Every migration must have a reversible `down` function
- Add columns as nullable first — add NOT NULL constraint only after backfilling
- Remove columns in a separate migration after removing all code references
- Use `CONCURRENTLY` for index creation on Postgres tables with data
- For large tables (>1M rows): batch updates, never update-all in one statement
- Document estimated runtime and rollback steps in the PR description
- Never modify or delete existing migration files — create new ones
- Test against a production-like data snapshot before merging
