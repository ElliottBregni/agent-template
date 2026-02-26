---
name: database-migrations
description: "Guide for writing and reviewing safe database schema migrations. Use this when asked to write a migration, review a schema change, add a column, drop a table, or plan an expand/contract migration."
license: MIT
---

# Skill: Database Migrations

Write, review, and plan safe database schema changes for production.

## Trigger
Invoked when schema changes are needed or migration PRs are under review.

## Migration Safety Rules

### Always Safe (non-breaking)
- Add a new nullable column
- Add a new table
- Add an index (use `CONCURRENTLY` in Postgres to avoid table lock)
- Add a new enum value (check ORM support)

### Requires Care (potentially blocking)
- Add a NOT NULL column → add with default or backfill in separate migration
- Remove a column → deploy code that ignores it first, then drop in next release
- Rename a column → add new column, backfill, update code, drop old column (3 deploys)
- Change column type → depends on type and data volume
- Add a unique constraint → validate existing data first

### Never Safe in Single Deploy (requires expand/contract)
- Rename a table → use view as bridge
- Drop a column in use → remove from code first
- Change primary key type → requires full migration plan

## Expand/Contract Pattern

For breaking changes, use 3-phase deployment:
1. **Expand**: Add new column/table alongside old one
2. **Migrate**: Backfill data, dual-write in code
3. **Contract**: Remove old column/table after validation

## Migration Checklist

Before merging:
- [ ] Migration is reversible (has `down` migration)
- [ ] Tested against production-like data volume
- [ ] No table-level locks on tables with >1M rows (use `CONCURRENTLY`, batching)
- [ ] Estimated runtime documented in PR
- [ ] Rollback plan documented
- [ ] Application code handles both old and new schema during deploy window

## Output
Migration files with up/down, PR description with estimated runtime, rollback plan, and test results.
