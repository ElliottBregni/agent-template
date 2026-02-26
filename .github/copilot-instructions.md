# Copilot Instructions

## Project
- **Name**: {{PROJECT_NAME}}
- **Stack**: {{STACK}}
- **Type**: SaaS — multi-tenant, production-grade

## Engineering Standards

### Code Quality
- Follow existing patterns in this repo — read before writing
- Make the minimum change necessary — no unrequested improvements
- One concern per PR — keep changes focused and reviewable
- Never commit secrets, .env files, or credentials

### Commits
- Conventional commits: `feat`, `fix`, `chore`, `docs`, `refactor`, `test`, `perf`
- Imperative mood, lowercase, under 72 chars: `fix(auth): prevent session fixation on login`
- No Co-Authored-By tags

### Testing
- Write tests for new functionality — match existing framework and patterns
- Cover happy path, edge cases, and error paths
- Mock all external dependencies

### Security (applies to all code)
- Validate all inputs at system boundaries (user input, external APIs)
- No hardcoded secrets — use environment variables
- No SQL string concatenation — use parameterized queries
- No unescaped user content in HTML output
- No sensitive data in logs or error responses

### Destructive Actions — Ask First
- Deleting files or database records
- Force-push or hard reset
- Schema drops or truncations
- CI/CD or infrastructure changes

## Key Commands
```bash
# dev
{{DEV_COMMAND}}

# test
{{TEST_COMMAND}}

# build
{{BUILD_COMMAND}}

# lint
{{LINT_COMMAND}}

# type check
{{TYPECHECK_COMMAND}}

# db migrate
{{MIGRATE_COMMAND}}
```

## Architecture
<!-- Describe key service boundaries, data flow, and architectural decisions -->
{{ARCHITECTURE_NOTES}}

## Agents Available

Use `@agent-name` to invoke a specialist:

| Agent | Use For |
|-------|---------|
| `@dev` | General coding, bug fixes, features |
| `@architect` | System design, ADRs, technical proposals |
| `@security` | Security audits, vulnerability review |
| `@oncall` | Incident response, postmortems, runbooks |
| `@product` | Issue specs, user stories, backlog triage |
| `@devops` | CI/CD, infra, deployment, observability |

## Slash Commands

| Command | Action |
|---------|--------|
| `/review-pr` | Full PR review |
| `/explain-code` | Explain selected code |
| `/security-review` | Security audit |
| `/incident-postmortem` | Generate postmortem |
| `/architecture-decision` | Write ADR |
| `/sprint-retro` | Sprint retrospective |
