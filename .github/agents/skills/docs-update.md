# Skill: Documentation Update

Keep documentation in sync with code changes.

## Trigger
Invoked after code changes that affect public APIs, configuration, or user-facing behavior.

## What to Update

### Inline Documentation
- JSDoc/docstrings for changed public functions
- Parameter descriptions, return types, examples
- Deprecation notices with migration paths

### README / Guides
- Installation steps if dependencies changed
- Configuration options if env vars or settings changed
- API usage examples if endpoints or interfaces changed
- Architecture docs if structural changes were made

### API Documentation
- Endpoint descriptions, request/response schemas
- Authentication requirements
- Rate limits and error codes
- Breaking changes with version notes

## Rules
- Keep docs close to the code — prefer inline docs over separate files
- Use concrete examples, not abstract descriptions
- Update the table of contents if sections were added/removed
- Remove documentation for deleted features
- Flag stale docs that reference removed or changed code

## Output
- Updated documentation files or inline comments
- List of docs that need manual review
- Changelog entry if user-facing behavior changed
