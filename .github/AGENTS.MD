# .github Agent Config

## Directory Structure

```
.github/
├── copilot-instructions.md          # Repo-wide Copilot instructions
├── instructions/                    # Path-specific rules (.instructions.md + applyTo globs)
│   └── tests.instructions.md
├── prompts/                         # Copilot slash commands (.prompt.md)
│   ├── review-pr.prompt.md
│   └── explain-code.prompt.md
└── agents/                          # Agent orchestration layer
    ├── agent.yaml                   # Entrypoint — model, skills, MCP, prompts
    ├── instructions.md              # System prompt / behavioral instructions
    ├── skills/                      # Capability definitions (what + how)
    │   ├── code-review.md
    │   ├── issue-triage.md
    │   ├── release-notes.md
    │   ├── test-generation.md
    │   └── docs-update.md
    ├── mcp/                         # MCP server layer
    │   ├── servers.json             # Server definitions (name, url, auth)
    │   ├── tools.json               # Tool manifests, allow/deny lists, rate limits
    │   └── configs/                 # Per-server overrides
    │       ├── github.json
    │       ├── slack.json
    │       ├── linear.json
    │       └── custom.json
    └── prompts/                     # Output templates (formatting, not behavior)
        ├── pr-description.md
        ├── commit-message.md
        └── summary.md
```

## Design Decisions

- **`agent.yaml`** — Single declarative entrypoint. References skills, MCP servers, and prompts. No magic strings in workflow YAML.
- **`skills/` vs `prompts/`** — Skills define capabilities (what the agent can do + how). Prompts are templates for specific outputs. Keeps behavioral instructions separate from formatting templates.
- **`mcp/servers.json`** — Centralizes MCP endpoints. Auth rotation and endpoint changes are a single-file update.
- **`mcp/configs/`** — Per-server overrides for tool filtering, rate limits, and scoped permissions.

## Separate From

These directories are **agent configuration only** — separate from:
- `.github/workflows/` — CI/CD automation
- `.github/ISSUE_TEMPLATE/` — issue templates
- `.github/PULL_REQUEST_TEMPLATE/` — PR templates
