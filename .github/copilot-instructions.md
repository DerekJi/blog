# GitHub Copilot Instructions

## Project Overview
This is a technical blog (Jekyll + GitHub Pages) focused on .NET, cloud-native architecture, and AI Agents.

## Writing Standards
- All published posts in `_posts/` must be in English.
- Chinese drafts live in `content/{article-slug}/draft-cn.md` before translation.
- File names use **kebab-case** only. No spaces, no underscores, no CamelCase.
- Dates are only added in `_posts/` filenames: `YYYY-MM-DD-{slug}-{lang}.md`.

## Jekyll Post Front Matter (required)
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

## Directory Roles (do not deviate)
- `_posts/` — published final posts only, never drafts
- `content/{slug}/` — all in-progress work for an article
- `content/{slug}/video/` — post-publication video production
- `.github/prompts/` — reusable prompt files
- `.github/instructions/` — context-specific instruction files
- `docs/` — project documentation only
- `images/` — site-wide images and post thumbnails
- `assets/` — CSS and JS only

## Language
Respond in the same language the user writes in (Chinese or English).
