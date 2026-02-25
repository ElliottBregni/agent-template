# Prompt: Commit Message

Generate a conventional commit message from staged changes.

## Format
```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

## Types
- `feat` — new feature
- `fix` — bug fix
- `docs` — documentation only
- `style` — formatting, no logic change
- `refactor` — code restructuring, no behavior change
- `perf` — performance improvement
- `test` — adding or updating tests
- `chore` — build, deps, tooling, CI
- `revert` — reverting a previous commit

## Rules
- Subject line: imperative mood, lowercase, no period, max 72 chars
- Scope: component or area affected (e.g., `auth`, `api`, `ui`)
- Body: explain "why" not "what" — the diff shows "what"
- Footer: `BREAKING CHANGE:` if applicable, issue refs (`Closes #123`)
- One logical change per commit

## Examples
```
feat(auth): add OAuth2 PKCE flow for mobile clients

Implements authorization code flow with PKCE to support native mobile
apps that cannot securely store client secrets.

Closes #142
```

```
fix(api): prevent race condition in concurrent session creation

Multiple simultaneous login requests could create duplicate sessions.
Added advisory lock on user_id during session creation.
```
