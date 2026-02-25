# Agent Config Template

Drop-in agent configuration for Claude Code and GitHub Copilot.

## What's Included

```
├── AGENTS.MD                    # Shared agent instructions (both tools read this)
├── CLAUDE.md                    # Claude Code project instructions
├── .mcp.json                    # Claude Code MCP servers
├── .claude/
│   ├── settings.json            # Permissions and config
│   ├── MEMORY.MD                # Session context (gitignored)
│   ├── skills/memory-collapse/  # Auto-collapse context skill
│   ├── hooks/post-edit-lint.sh  # Auto-lint on file edit
│   ├── agents/                  # Custom subagents
│   ├── mcp/                     # MCP config files
│   └── tools/                   # Custom tools
├── .github/
│   ├── copilot-instructions.md  # Copilot project instructions
│   ├── AGENTS.MD                # Explains agent dirs in .github
│   ├── agents/                  # Copilot agents
│   ├── prompts/                 # Copilot slash commands
│   └── instructions/            # Path-specific Copilot rules
├── .vscode/
│   └── mcp.json                 # VS Code Copilot MCP servers
├── .copilot/
│   └── mcp-config.json          # Copilot CLI MCP servers
├── .junie/
│   └── mcp/mcp.json             # JetBrains (Junie) MCP servers
├── claude_desktop_config.json   # Claude Desktop / Opus 4.5 MCP servers
└── .gitignore.agent-additions   # Append to your .gitignore
```

## Setup

1. Use this as a GitHub template: **Use this template** → Create new repo
2. Or copy into an existing repo
3. Replace `{{PROJECT_NAME}}` and `{{STACK}}` placeholders in:
   - `AGENTS.MD`
   - `CLAUDE.md`
   - `.github/copilot-instructions.md`
4. Append `.gitignore.agent-additions` to your `.gitignore`
5. Uncomment MCP servers you need in the relevant config:
   - `.mcp.json` — Claude Code
   - `.vscode/mcp.json` — VS Code Copilot
   - `.copilot/mcp-config.json` — Copilot CLI (`cp` to `~/.copilot/mcp-config.json`)
   - `.junie/mcp/mcp.json` — JetBrains IDEs (IntelliJ, WebStorm, etc.)
   - `claude_desktop_config.json` — Claude Desktop app (`cp` to `~/Library/Application Support/Claude/claude_desktop_config.json`)
6. Run `chmod +x .claude/hooks/*.sh`
