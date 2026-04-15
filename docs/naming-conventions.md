# Naming Conventions

All files and directories in this repository follow **kebab-case** by default. Exceptions are noted explicitly.

---

## Article Slugs

An article slug identifies the article across all its files and the published URL.

- **Format:** `kebab-case`, lowercase, hyphens only
- **No date prefix** — dates only appear in `_posts/` filenames
- **Example:** `mcp-vs-cli`, `why-we-removed-signalr`, `overposting-json-patch`

---

## Directory Names

| Directory | Naming Rule | Example |
|-----------|-------------|---------|
| `content/{slug}/` | Article slug (kebab-case) | `content/mcp-vs-cli/` |
| `content/{slug}/video/` | Fixed name | — |
| `content/{slug}/video/remotion/` | Fixed name | — |
| `images/` | Site-level; flat | — |
| `_posts/` | Managed by Jekyll | — |
| `docs/` | Topic in kebab-case | `docs/troubleshooting/` |
| `.github/prompts/` | Action verb + noun (kebab-case) | `new-article.prompt.md` |
| `.github/instructions/` | Topic + `.instructions.md` | `blog-writing.instructions.md` |

---

## File Names

### Content Files (`content/{slug}/`)

| File | Purpose |
|------|---------|
| `STATUS.md` | Progress tracker and notes |
| `brainstorm.md` | AI discussion notes, angles, research |
| `outline.md` | Article outline (iterated) |
| `draft-cn.md` | Chinese draft |
| `draft-cn-{variant}.md` | Alternative CN draft by a specific AI (e.g., `draft-cn-gemini.md`) |
| `draft-en.md` | English draft |

### Video Files (`content/{slug}/video/`)

| File/Dir | Purpose |
|----------|---------|
| `script.md` | Video narration script |
| `audio/` | edge-tts output (gitignored) |
| `remotion/` | Remotion React project (gitignored build artifacts) |

### Published Posts (`_posts/`)

- **Format:** `YYYY-MM-DD-{slug}-{lang}.md`
- **Language codes:** `en` (English), `cn` (Chinese)
- **Example:** `2026-04-12-mcp-vs-cli-paradigm-shift-en.md`

Note: The slug in `_posts/` does not need to exactly match `content/{slug}/` — it should reflect the final published title slug.

### Images (`images/`)

| Pattern | Purpose |
|---------|---------|
| `{slug}-thumb.png` | Post thumbnail (referenced in front matter) |
| `{slug}-{description}.png` | Diagram or screenshot |

- Use lowercase kebab-case
- Prefer PNG for diagrams, JPEG for photos

### Documentation (`docs/`)

- Use kebab-case filenames
- `README.md` is allowed as an index file within subdirectories

### Prompt Files (`.github/prompts/`)

- **Format:** `{action}-{subject}.prompt.md`
- **Examples:** `new-article.prompt.md`, `translate-cn-to-en.prompt.md`

### Instruction Files (`.github/instructions/`)

- **Format:** `{topic}.instructions.md`
- **Examples:** `blog-writing.instructions.md`, `video-production.instructions.md`

---

## What to Avoid

| Avoid | Use Instead |
|-------|------------|
| `MyArticle.md` | `my-article.md` |
| `draft_cn.md` | `draft-cn.md` |
| `MCP_vs_CLI_Architecture.md` | `draft-cn.md` inside `content/mcp-vs-cli/` |
| Spaces in directory names | Never use spaces |
| Date prefix in `content/` slugs | Only in `_posts/` |
