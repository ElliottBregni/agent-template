# Agent Config Template

Drop-in agent configuration for Claude Code, GitHub Copilot, Copilot CLI, and Claude Desktop.
Built for a senior staff SaaS engineering team. Uses Claude Opus 4.5 throughout.

## What's Included

```
├── plugin.json                          # Copilot CLI plugin manifest (install with /plugin)
├── AGENTS.MD                            # Shared agent instructions
├── CLAUDE.md                            # Claude Code instructions
├── .mcp.json                            # MCP catalog (~55 servers, all commented out)
│
├── .github/                             # ── GitHub Copilot + Copilot CLI ──
│   ├── copilot-instructions.md          # Global repo rules + agent directory
│   ├── AGENTS.MD                        # Structure documentation
│   │
│   ├── hooks/                           # 🆕 Copilot CLI lifecycle hooks (GA Feb 2026)
│   │   └── hooks.json                   # preToolUse safety gate + full audit logging
│   │
│   ├── instructions/                    # Path-scoped rules (auto-applied by file pattern)
│   │   ├── tests.instructions.md        # *.test.*, *.spec.*, /tests/**
│   │   ├── api.instructions.md          # /api/**, /routes/**, /handlers/**
│   │   ├── migrations.instructions.md   # /migrations/**, *.migration.*
│   │   ├── security.instructions.md     # ** (global security rules)
│   │   └── frontend.instructions.md     # /components/**, *.tsx, *.jsx, *.vue
│   │
│   ├── prompts/                         # Slash commands (/command-name)
│   │   ├── review-pr.prompt.md          # /review-pr
│   │   ├── explain-code.prompt.md       # /explain-code
│   │   ├── security-review.prompt.md    # /security-review
│   │   ├── incident-postmortem.prompt.md # /incident-postmortem
│   │   ├── architecture-decision.prompt.md # /architecture-decision
│   │   └── sprint-retro.prompt.md       # /sprint-retro
│   │
│   └── agents/                          # Agent orchestration
│       ├── agent.yaml                   # Entrypoint: model, agents, skills, hooks, MCP
│       ├── instructions.md              # Default agent system prompt
│       │
│       ├── dev.agent.md                 # 🆕 General engineering (Claude Code behavior)
│       ├── architect.agent.md           # 🆕 System design, ADRs (read-only)
│       ├── security.agent.md            # 🆕 Security audits, OWASP (read-only)
│       ├── oncall.agent.md              # 🆕 Incident response, postmortems
│       ├── product.agent.md             # 🆕 Issue specs, backlog (read-only)
│       ├── devops.agent.md              # 🆕 CI/CD, infra, observability
│       │
│       ├── skills/                      # Reusable capabilities
│       │   ├── code-review.md
│       │   ├── test-generation.md
│       │   ├── docs-update.md
│       │   ├── issue-triage.md
│       │   ├── release-notes.md
│       │   ├── sprint-planning.md       # 🆕
│       │   ├── architecture-review.md   # 🆕
│       │   ├── api-design.md            # 🆕
│       │   ├── database-migrations.md   # 🆕
│       │   ├── security-audit.md        # 🆕
│       │   ├── dependency-audit.md      # 🆕
│       │   ├── incident-response.md     # 🆕
│       │   └── performance-audit.md     # 🆕
│       │
│       ├── mcp/                         # MCP server layer
│       │   ├── servers.json             # Server definitions + auth
│       │   ├── tools.json               # Tool allow/deny + rate limits
│       │   └── configs/                 # Per-server overrides
│       │
│       └── prompts/                     # Output templates
│           ├── pr-description.md
│           ├── commit-message.md
│           └── summary.md
│
├── .claude/                             # ── Claude Code ──
│   ├── settings.json
│   ├── MEMORY.MD
│   ├── skills/memory-collapse/
│   └── hooks/post-edit-lint.sh
│
├── .vscode/mcp.json                     # VS Code Copilot MCP servers
├── .copilot/                            # Copilot CLI global config
├── claude_desktop_config.json           # Claude Desktop MCP servers
└── .gitignore.agent-additions
```

## Quick Start

1. **Use as template**: `Use this template` → new repo, or copy into existing repo
2. **Replace placeholders** in:
   - `AGENTS.MD`, `CLAUDE.md`, `.github/copilot-instructions.md`, `.github/agents/instructions.md`
   - Search for `{{PROJECT_NAME}}`, `{{STACK}}`, `{{DEV_COMMAND}}`, etc.
3. **Enable MCP servers** you need — uncomment in `.mcp.json` and `.github/agents/mcp/servers.json`
4. **Add secrets** to `.github/agents/mcp/servers.json` (or use GitHub secrets via `${{ secrets.NAME }}`)
5. **Install as Copilot CLI plugin** (after pushing to GitHub):
   ```bash
   copilot plugin install your-org/your-repo
   ```
6. **Make hooks executable** (Claude Code):
   ```bash
   chmod +x .claude/hooks/*.sh
   ```

## Agents

Invoke with `@agent-name` in Copilot Chat or Copilot CLI:

| Agent | Model | Tools | Role |
|-------|-------|-------|------|
| `@dev` | Opus 4.5 | read, edit, search, run, create, delete | General engineering |
| `@architect` | Opus 4.5 | read, search, list | System design, ADRs |
| `@security` | Opus 4.5 | read, search, list | Security audits (read-only) |
| `@oncall` | Opus 4.5 | read, search, run | Incident response |
| `@product` | Opus 4.5 | read, search, list | Specs, backlog (read-only) |
| `@devops` | Opus 4.5 | read, edit, search, run, create | CI/CD, infra |

## Hooks (Copilot CLI GA — Feb 2026)

`hooks.json` enforces safety rules at the tool level — not just via instructions:

| Hook | What it does |
|------|-------------|
| `preToolUse` | Blocks: force-push to main, `git reset --hard`, `rm -rf` on non-build dirs, `DROP TABLE`, `--no-verify`, hardcoded secrets |
| `sessionStart/End` | Logs session with source/reason |
| `postToolUse` | Logs tool results |
| `errorOccurred` | Logs errors |

Audit log: `~/.copilot/audit.log`

## Slash Commands

| Command | Description |
|---------|-------------|
| `/review-pr` | Full quality, security, and correctness review |
| `/explain-code` | Plain language explanation of selected code |
| `/security-review` | OWASP-based security audit |
| `/incident-postmortem` | Blameless postmortem from incident details |
| `/architecture-decision` | Write a numbered ADR |
| `/sprint-retro` | Sprint retrospective from sprint data |

## Copilot CLI Commands (New in GA)

| Command | Description |
|---------|-------------|
| `Shift+Tab` | Plan mode — creates a plan before acting |
| `--autopilot` | Autonomous mode, no confirmation pauses |
| `& [task]` | Background delegation |
| `/diff` | Syntax-highlighted diff of changes |
| `/review` | Review staged changes |
| `/model` | Switch model mid-session |
| `Esc-Esc` | Rewind files to previous state |
| `copilot fleet` | Run multiple agents in parallel |

## Architecture Decisions

**Hooks over instructions** — Safety rules enforced at the tool layer. The model can't be talked out of a hook.

**Specialist agents with scoped tools** — `@security` has no write tools by design. `@product` can't edit files. Blast radius is limited to what each agent needs.

**Path-scoped instructions** — API security rules only load when editing API files. Migration rules only load for migration files. Reduces noise and context bloat.

**Skills vs prompts** — Skills define *how to do something* (behavioral). Prompts are slash commands that produce *output artifacts* (PR descriptions, ADRs, postmortems).

**MCP centralized in servers.json** — Rotate auth tokens in one place. Per-server overrides in `configs/` for scoped permissions.

## Tool Compatibility

| Config | Tool | MCP Format | Scope |
|--------|------|------------|-------|
| `.mcp.json` | Claude Code | `stdio` / `http` | Project |
| `.vscode/mcp.json` | VS Code Copilot | `command` / `http` | Project |
| `.github/hooks/hooks.json` | Copilot CLI | shell scripts | Repo (must be on default branch) |
| `.github/agents/*.agent.md` | Copilot CLI + VS Code | YAML frontmatter + markdown | Repo |
| `plugin.json` | Copilot CLI | plugin manifest | Installable package |
| `.github/agents/mcp/servers.json` | GitHub Coding Agent | `url` + secrets | Repo |
| `claude_desktop_config.json` | Claude Desktop | `command` only | Global |
