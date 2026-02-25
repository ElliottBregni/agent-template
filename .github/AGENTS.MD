# .github Agent Config

The following directories are used by GitHub Copilot:

- `copilot-instructions.md` — repo-wide instructions for Copilot
- `instructions/` — path-specific instruction files (`.instructions.md` with `applyTo` globs)
- `prompts/` — reusable prompt files (`.prompt.md`) available as slash commands
- `agents/` — custom Copilot agent definitions (`.agent.md`)

These are separate from CI/CD workflows, PR templates, and other standard `.github/` files.
