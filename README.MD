# Agent Config Template

Drop-in agent configuration for Claude Code, GitHub Copilot, Copilot CLI, and Claude Desktop.

## What's Included

```
├── AGENTS.MD                            # Shared agent instructions (all tools read this)
├── CLAUDE.md                            # Claude Code project instructions
├── .mcp.json                            # Claude Code MCP servers (~55 servers)
│
├── .claude/                             # ── Claude Code ──
│   ├── settings.json                    # Permissions and config
│   ├── MEMORY.MD                        # Session context (gitignored)
│   ├── skills/memory-collapse/          # Auto-collapse context skill
│   ├── hooks/post-edit-lint.sh          # Auto-lint on file edit
│   ├── agents/                          # Custom subagents
│   ├── mcp/                             # MCP config files
│   └── tools/                           # Custom tools
│
├── .github/                             # ── GitHub Copilot ──
│   ├── copilot-instructions.md          # Repo-wide Copilot instructions
│   ├── AGENTS.MD                        # Explains agent structure
│   ├── instructions/                    # Path-specific Copilot rules
│   │   └── tests.instructions.md
│   ├── prompts/                         # Copilot slash commands
│   │   ├── review-pr.prompt.md
│   │   └── explain-code.prompt.md
│   └── agents/                          # Agent orchestration layer
│       ├── agent.yaml                   # Entrypoint (model, skills, MCP, prompts)
│       ├── instructions.md              # System prompt
│       ├── skills/                      # Capability definitions
│       │   ├── code-review.md
│       │   ├── issue-triage.md
│       │   ├── release-notes.md
│       │   ├── test-generation.md
│       │   └── docs-update.md
│       ├── mcp/                         # MCP server layer
│       │   ├── servers.json             # Server definitions
│       │   ├── tools.json               # Tool manifests + rate limits
│       │   └── configs/                 # Per-server overrides
│       │       ├── github.json
│       │       ├── slack.json
│       │       ├── linear.json
│       │       └── custom.json
│       └── prompts/                     # Output templates
│           ├── pr-description.md
│           ├── commit-message.md
│           └── summary.md
│
├── .vscode/                             # ── VS Code Copilot ──
│   └── mcp.json                         # VS Code Copilot MCP servers (~55 servers)
│
├── .copilot/                            # ── Copilot CLI ──
│   ├── agent.yaml                       # Entrypoint (model, skills, MCP, prompts)
│   ├── instructions.md                  # System prompt
│   ├── mcp-config.json                  # Full MCP server catalog (~55 servers)
│   ├── agents/                          # CLI agent profiles
│   │   ├── code-review.md
│   │   ├── test-writer.md
│   │   └── doc-writer.md
│   ├── skills/                          # Capability definitions
│   │   ├── code-review.md
│   │   ├── issue-triage.md
│   │   ├── release-notes.md
│   │   ├── test-generation.md
│   │   └── docs-update.md
│   ├── mcp/                             # MCP server layer
│   │   ├── servers.json                 # Server definitions
│   │   ├── tools.json                   # Tool manifests + rate limits
│   │   └── configs/                     # Per-server overrides
│   │       ├── github.json
│   │       ├── slack.json
│   │       ├── linear.json
│   │       └── custom.json
│   └── prompts/                         # Output templates
│       ├── pr-description.md
│       ├── commit-message.md
│       └── summary.md
│
├── claude_desktop_config.json           # Claude Desktop MCP servers (~55 servers)
└── .gitignore.agent-additions           # Append to your .gitignore
```

## Setup

1. Use this as a GitHub template: **Use this template** → Create new repo
2. Or copy into an existing repo
3. Replace `{{PROJECT_NAME}}` and `{{STACK}}` placeholders in:
   - `AGENTS.MD`
   - `CLAUDE.md`
   - `.github/copilot-instructions.md`
   - `.github/agents/instructions.md`
   - `.copilot/instructions.md`
4. Append `.gitignore.agent-additions` to your `.gitignore`
5. Uncomment MCP servers you need in the relevant config:
   - `.mcp.json` — Claude Code
   - `.vscode/mcp.json` — VS Code Copilot
   - `.copilot/mcp-config.json` — Copilot CLI (`cp` to `~/.copilot/mcp-config.json`)
   - `claude_desktop_config.json` — Claude Desktop (`cp` to `~/Library/Application Support/Claude/claude_desktop_config.json`)
6. Configure MCP servers in the agents layer:
   - `.github/agents/mcp/servers.json` — Add secrets and enable servers
   - `.copilot/mcp/servers.json` — Same for Copilot CLI
7. Run `chmod +x .claude/hooks/*.sh`

## Architecture

### Skills vs Prompts
- **Skills** (`skills/`) — Define capabilities. What the agent *can do* and *how*. Behavioral instructions.
- **Prompts** (`prompts/`) — Output templates. Formatting for specific artifacts (PR descriptions, commit messages). No behavioral logic.

### MCP Layer
- **`servers.json`** — Centralized server definitions. Auth rotation is a single-file change.
- **`tools.json`** — Tool allow/deny lists and rate limits. Controls what each server can do.
- **`configs/`** — Per-server overrides for scoped permissions, tool filtering, and custom settings.

### `agent.yaml`
Single declarative entrypoint that references everything. Keeps orchestration clean — no magic strings buried in workflow YAML.

## Tool Compatibility

| Config | Tool | MCP Format | Scope |
|--------|------|------------|-------|
| `.mcp.json` | Claude Code | `stdio` / `http` | Project |
| `.vscode/mcp.json` | VS Code Copilot | `command` / `http` | Project |
| `.copilot/mcp-config.json` | Copilot CLI | `stdio` / `http` / `remote` | Global (`~/.copilot/`) |
| `claude_desktop_config.json` | Claude Desktop | `command` only (use `mcp-remote` for HTTP) | Global (`~/Library/...`) |
| `.github/agents/mcp/` | GitHub Agents | `url` + secrets | Repo |
| `.copilot/mcp/` | Copilot CLI Agents | `stdio` / `http` | CLI |
