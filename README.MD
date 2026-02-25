# Agent Config Template

Drop-in agent configuration for Claude Code, GitHub Copilot, Copilot CLI, Claude Desktop, and JetBrains IDEs.

## What's Included

```
├── AGENTS.MD                        # Shared agent instructions (all tools read this)
├── CLAUDE.md                        # Claude Code project instructions
├── .mcp.json                        # Claude Code MCP servers (~55 servers)
│
├── .claude/                         # ── Claude Code ──
│   ├── settings.json                # Permissions and config
│   ├── MEMORY.MD                    # Session context (gitignored)
│   ├── skills/memory-collapse/      # Auto-collapse context skill
│   ├── hooks/post-edit-lint.sh      # Auto-lint on file edit
│   ├── agents/                      # Custom subagents
│   ├── mcp/                         # MCP config files
│   └── tools/                       # Custom tools
│
├── .github/                         # ── GitHub Copilot (VS Code / Coding Agent) ──
│   ├── copilot-instructions.md      # Copilot project instructions
│   ├── AGENTS.MD                    # Explains agent dirs in .github
│   ├── agents/                      # Copilot agents
│   ├── prompts/                     # Copilot slash commands
│   └── instructions/                # Path-specific Copilot rules
│
├── .vscode/                         # ── VS Code Copilot ──
│   └── mcp.json                     # VS Code Copilot MCP servers (~55 servers)
│
├── .copilot/                        # ── Copilot CLI ──
│   ├── mcp-config.json              # Copilot CLI MCP servers (~55 servers)
│   └── agents/                      # Copilot CLI agent profiles
│       ├── code-review.md           # Staged changes reviewer
│       ├── test-writer.md           # Test generation agent
│       └── doc-writer.md            # Documentation generator
│
├── .junie/                          # ── JetBrains Junie ──
│   ├── guidelines.md                # Junie agent instructions
│   └── mcp/
│       └── mcp.json                 # Junie MCP servers (~55 servers)
│
├── .aiassistant/                    # ── JetBrains AI Assistant ──
│   └── rules/
│       ├── coding-standards.md      # Always-on coding rules
│       ├── test-guidelines.md       # Test file rules (by pattern)
│       └── review-guide.md          # Manual code review rules
│
├── .aiignore                        # JetBrains AI exclusions
├── claude_desktop_config.json       # Claude Desktop MCP servers (~55 servers)
└── .gitignore.agent-additions       # Append to your .gitignore
```

## Setup

1. Use this as a GitHub template: **Use this template** → Create new repo
2. Or copy into an existing repo
3. Replace `{{PROJECT_NAME}}` and `{{STACK}}` placeholders in:
   - `AGENTS.MD`
   - `CLAUDE.md`
   - `.github/copilot-instructions.md`
   - `.junie/guidelines.md`
4. Append `.gitignore.agent-additions` to your `.gitignore`
5. Uncomment MCP servers you need in the relevant config:
   - `.mcp.json` — Claude Code
   - `.vscode/mcp.json` — VS Code Copilot
   - `.copilot/mcp-config.json` — Copilot CLI (`cp` to `~/.copilot/mcp-config.json`)
   - `.junie/mcp/mcp.json` — JetBrains IDEs (IntelliJ, WebStorm, etc.)
   - `claude_desktop_config.json` — Claude Desktop app (`cp` to `~/Library/Application Support/Claude/claude_desktop_config.json`)
6. Run `chmod +x .claude/hooks/*.sh`
7. Edit `.aiassistant/rules/*.md` to match your project conventions
8. Edit `.aiignore` to exclude project-specific paths from AI processing

## Tool Compatibility

| Config | Tool | MCP Format | Scope |
|--------|------|------------|-------|
| `.mcp.json` | Claude Code | `stdio` / `http` | Project |
| `.vscode/mcp.json` | VS Code Copilot | `command` / `http` | Project |
| `.copilot/mcp-config.json` | Copilot CLI | `stdio` / `http` / `remote` | Global (`~/.copilot/`) |
| `.junie/mcp/mcp.json` | JetBrains Junie | `command` / `url` | Project |
| `claude_desktop_config.json` | Claude Desktop | `command` only (use `mcp-remote` for HTTP) | Global (`~/Library/...`) |

## Agent / Instruction Files

| File | Tool | Purpose |
|------|------|---------|
| `AGENTS.MD` | All | Shared project context and conventions |
| `CLAUDE.md` | Claude Code | Claude-specific project instructions |
| `.github/copilot-instructions.md` | VS Code Copilot | Copilot-specific instructions |
| `.github/instructions/*.md` | VS Code Copilot | Path-specific rules (YAML frontmatter) |
| `.github/agents/*.md` | VS Code Copilot / Copilot CLI | Agent definitions |
| `.copilot/agents/*.md` | Copilot CLI | CLI-specific agent profiles |
| `.junie/guidelines.md` | JetBrains Junie | Junie agent instructions |
| `.aiassistant/rules/*.md` | JetBrains AI Assistant | Always/pattern/manual rules |
| `.aiignore` | JetBrains | Files excluded from AI processing |
