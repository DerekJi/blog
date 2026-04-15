# Workflow: From Idea to Published Article (and Video)

This document describes the end-to-end workflow for this blog — from initial idea through publication and optional video production.

---

## Phase 1: Ideation & Planning

**Working directory:** `content/{slug}/`

1. Use the prompt `.github/prompts/new-article.prompt.md` to kick off a new article with AI.
2. AI creates `brainstorm.md` (angles, competitive research) and `outline.md` (section structure).
3. Iterate on the outline until the article structure feels solid.
4. Update `STATUS.md` checklist as each step completes.

**Files produced:**
```
content/{slug}/brainstorm.md
content/{slug}/outline.md
content/{slug}/STATUS.md
```

---

## Phase 2: Chinese Draft

1. Write `draft-cn.md` based on the approved outline.
2. Iterate with AI using `.github/instructions/blog-writing.instructions.md` as context.
3. Polish until the CN draft is approved.

**Tip:** Open `draft-cn.md` and `outline.md` side by side. Use `@file` references in Copilot to keep AI focused on the right file.

**Files produced:**
```
content/{slug}/draft-cn.md
```

---

## Phase 3: English Translation

1. Use the prompt `.github/prompts/translate-cn-to-en.prompt.md`.
2. AI produces `draft-en.md` — a native-English adaptation (not a literal translation).
3. Polish the English draft independently. The CN draft is the source of truth for meaning; EN draft is optimized for English readers.

**Files produced:**
```
content/{slug}/draft-en.md
```

---

## Phase 4: Diagrams & Images

If the article needs diagrams:
- Use external tools (Mermaid, Excalidraw, draw.io, etc.) to generate diagram images.
- Save thumbnails and diagram images to `images/`.
- Reference them in the draft via `/images/{slug}-thumb.png`.

**Note:** For Mermaid diagrams embedded directly in posts, Jekyll renders them via the theme's JS. For external diagrams, save the source file alongside the image with the same base name (e.g., `images/mcp-flow.excalidraw`).

---

## Phase 5: Publish

1. Generate the final blog post from the approved English draft.
2. Ensure Jekyll front matter is complete:
   ```yaml
   ---
   title: "Article Title"
   date: YYYY-MM-DD
   tags: [tag1, tag2]
   description: "One sentence summary."
   image: /images/{slug}-thumb.png
   lang: en
   ---
   ```
3. Save to `_posts/YYYY-MM-DD-{slug}-en.md`.
4. Test locally: `docker-compose up` → open http://localhost:4000
5. Push to GitHub → GitHub Actions builds and deploys automatically.

**Files produced:**
```
_posts/YYYY-MM-DD-{slug}-en.md
images/{slug}-thumb.png
```

---

## Phase 6: Video Production (Optional, Post-Publication)

**Working directory:** `content/{slug}/video/`

### Step 6a — Video Script
- Use `.github/prompts/article-to-video-script.prompt.md`.
- AI adapts the published article into a spoken-word video script.
- Output: `content/{slug}/video/script.md`

### Step 6b — Audio
- Generate narration audio with `edge-tts`:
  ```bash
  edge-tts --voice en-US-EricNeural --file video/script.md --write-media video/audio/narration.mp3
  ```
- Audio files are gitignored (binary + large).

### Step 6c — Remotion Project
- Use `.github/prompts/generate-remotion-project.prompt.md` (run via Claude Code).
- Claude Code generates a complete Remotion React project at `content/{slug}/video/remotion/`.
- Preview: `npx remotion preview`
- Render: `npx remotion render MainVideo out/video.mp4`

**Files produced:**
```
content/{slug}/video/script.md
content/{slug}/video/audio/          ← gitignored
content/{slug}/video/remotion/       ← gitignored (node_modules, out, .cache)
```

---

## Summary Table

| Phase | Input | Output | AI Tool |
|-------|-------|--------|---------|
| 1. Ideation | Topic idea | `brainstorm.md`, `outline.md` | `new-article.prompt.md` |
| 2. CN Draft | Outline | `draft-cn.md` | `blog-writing.instructions.md` |
| 3. EN Translation | `draft-cn.md` | `draft-en.md` | `translate-cn-to-en.prompt.md` |
| 4. Diagrams | Draft | Images in `images/` | External tools |
| 5. Publish | `draft-en.md` | `_posts/...md` | Manual |
| 6a. Video Script | Published post | `video/script.md` | `article-to-video-script.prompt.md` |
| 6b. Audio | `video/script.md` | `video/audio/` | edge-tts CLI |
| 6c. Remotion | `video/script.md` | `video/remotion/` | `generate-remotion-project.prompt.md` (Claude Code) |
