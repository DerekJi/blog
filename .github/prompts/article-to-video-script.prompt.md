---
mode: edit
description: Convert a published article into a video script
---
Convert the published article at `_posts/{filename}` (or `content/{slug}/draft-en.md`) into a video script.

Write the result to `content/{slug}/video/script.md`.

Script rules:
- Rewrite for spoken word. Sentences max 20 words.
- Each scene starts with a `[SCENE: description]` marker (e.g., `[SCENE: Code editor showing the ConfigureServices method]`).
- Remove or paraphrase code-heavy sections into narration.
- Add natural transitions between sections ("Now here's where it gets interesting...", "But wait—").
- Target: 8–12 minutes spoken at 140 wpm ≈ 1100–1680 words.

Script format:
```markdown
# Video Script: {Article Title}

[SCENE: Title card]
Welcome to...

[SCENE: ...]
Narration text...
```

After writing, list any sections that need custom graphics or diagrams.
