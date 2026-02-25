---
name: memory-collapse
description: Automatically collapse conversation context into MEMORY.MD every 5 prompts
---

# Memory Collapse

## Trigger
Every 5 user prompts, automatically collapse the current conversation context into MEMORY.MD.

## Behavior
1. Count user prompts in the current session.
2. On every 5th prompt (5, 10, 15, ...), before responding:
   - Summarize key decisions, actions taken, and current state from the last 5 exchanges.
   - Append the summary to `.claude/MEMORY.MD` under `## Session Context`.
   - Use concise bullet points. Include: what was done, what was decided, any open items.
   - Prefix each collapse with a timestamp header: `### YYYY-MM-DD HHmm`
3. Do not duplicate entries already in MEMORY.MD.
4. Keep each collapse to 5-10 bullet points max.

## Notes
- This skill runs silently — no need to announce the collapse unless the user asks.
- If context is minimal (e.g., simple Q&A), skip the collapse.
