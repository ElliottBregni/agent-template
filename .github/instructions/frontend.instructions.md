---
applyTo: "**/components/**,**/pages/**,**/views/**,**/app/**,**/*.tsx,**/*.jsx,**/*.vue,**/*.svelte"
---

When writing or modifying frontend code:

- Never store sensitive data (tokens, PII) in localStorage — use httpOnly cookies or memory
- Escape user-generated content — never use dangerouslySetInnerHTML / v-html with untrusted input
- Lazy-load routes and heavy components to keep initial bundle small
- Avoid layout thrashing: batch DOM reads before writes
- Memoize expensive computations; avoid unnecessary re-renders
- Use semantic HTML and accessible attributes (aria-*, role, label associations)
- Handle loading, error, and empty states explicitly — no silent null renders
- Never make API calls directly from components — use service/hook abstractions
