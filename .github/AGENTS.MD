# .github Agent Config

This directory configures GitHub Copilot agents, skills, hooks, and instructions for this repo.

## Directory Structure

```
.github/
├── copilot-instructions.md          # Global Copilot rules for this repo
│
├── instructions/                    # Path-scoped rules (.instructions.md)
│   ├── tests.instructions.md        # applyTo: test files
│   ├── api.instructions.md          # applyTo: API routes/handlers
│   ├── migrations.instructions.md   # applyTo: migration files
│   ├── security.instructions.md     # applyTo: all files (global security rules)
│   └── frontend.instructions.md     # applyTo: components, pages, views
│
├── prompts/                         # Slash commands (.prompt.md)
│   ├── review-pr.prompt.md          # /review-pr
│   ├── explain-code.prompt.md       # /explain-code
│   ├── security-review.prompt.md    # /security-review
│   ├── incident-postmortem.prompt.md # /incident-postmortem
│   ├── architecture-decision.prompt.md # /architecture-decision
│   └── sprint-retro.prompt.md       # /sprint-retro
│
├── hooks/                           # Copilot CLI lifecycle hooks
│   └── hooks.json                   # preToolUse safety gate + audit logging
│
└── agents/                          # Agent definitions
    ├── agent.yaml                   # Entrypoint (model, skills, hooks, MCP)
    │
    ├── dev.agent.md                 # General engineering agent (Claude Code-style)
    ├── architect.agent.md           # System design, ADRs, technical review
    ├── security.agent.md            # Security audit, OWASP, read-only
    ├── oncall.agent.md              # Incident response, postmortems, runbooks
    ├── product.agent.md             # Issue specs, user stories, backlog triage
    ├── devops.agent.md              # CI/CD, infra, observability
    │
    ├── skills/                      # Reusable capability definitions
    │   ├── code-review.md           # PR review checklist
    │   ├── issue-triage.md          # Issue classification and priority
    │   ├── release-notes.md         # Changelog generation
    │   ├── test-generation.md       # Test writing patterns
    │   ├── docs-update.md           # Documentation sync
    │   ├── incident-response.md     # Incident triage and coordination
    │   ├── architecture-review.md   # Design review checklist
    │   ├── security-audit.md        # Security checklist
    │   ├── dependency-audit.md      # Dependency health and CVEs
    │   ├── database-migrations.md   # Safe migration patterns
    │   ├── api-design.md            # REST/GraphQL conventions
    │   ├── sprint-planning.md       # Sprint sizing and sequencing
    │   └── performance-audit.md     # Latency and load analysis
    │
    ├── mcp/                         # MCP server layer
    │   ├── servers.json             # Server definitions (name, url, auth)
    │   ├── tools.json               # Tool allow/deny lists, rate limits
    │   └── configs/                 # Per-server overrides
    │       ├── github.json
    │       ├── slack.json
    │       ├── linear.json
    │       └── custom.json
    │
    └── prompts/                     # Output templates
        ├── pr-description.md
        ├── commit-message.md
        └── summary.md
```

## Copilot CLI — New GA Features (Feb 2026)

### Hooks (`hooks/hooks.json`)
Lifecycle scripts that run at agent execution points:
- `sessionStart` / `sessionEnd` — audit logging
- `userPromptSubmitted` — prompt logging
- `preToolUse` — **safety gate**: blocks dangerous commands, hardcoded secrets, destructive DB ops
- `postToolUse` — result logging
- `errorOccurred` — error logging

Audit log: `~/.copilot/audit.log`

### Agents (`.agent.md` format)
Specialized agents invoked by name. YAML frontmatter controls:
- `model` — AI model (claude-opus-4-5, claude-sonnet-4-6, etc.)
- `tools` — allowed tool list (omit = all tools)
- `mcp-servers` — MCP servers available to this agent
- `target` — restrict to `vscode` or `github-copilot`

### Copilot CLI Commands
| Command | Description |
|---------|-------------|
| `Shift+Tab` | Toggle plan mode (plans before acting) |
| `copilot --autopilot` | Autonomous mode (no approval pauses) |
| `& task description` | Background delegation |
| `/diff` | View syntax-highlighted changes |
| `/review` | Review staged changes |
| `/model` | Switch model mid-session |
| `Esc-Esc` | Rewind to previous file state |

### Fleet (Parallel Tasks)
Run multiple agents simultaneously:
```bash
copilot fleet
```
Enables parallel workstreams — one agent per task.

## Design Decisions

- **Hooks over manual discipline** — safety rules enforced at the tool layer, not just instructions
- **Specialist agents** — `@security` is read-only, `@oncall` has shell access, `@product` has no write tools
- **Path-scoped instructions** — API rules only apply to API files, migration rules only to migration files
- **Skills vs prompts** — Skills define reusable capabilities (behavioral). Prompts are slash commands (output templates).
- **MCP at the server layer** — auth rotation is a single-file change in `servers.json`
