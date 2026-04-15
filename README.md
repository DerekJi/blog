# Piechowski.io — Technical Blog

Jekyll + GitHub Pages blog focused on .NET, cloud-native architecture, and AI Agents.

---

## Quick Start (Local Preview)

```bash
docker-compose up
```

Open → http://localhost:4000

---

## Directory Structure

```
blog/
├── _posts/                  # Published posts (YYYY-MM-DD-{slug}-en.md)
├── _layouts/                # Jekyll HTML templates
├── _includes/               # Jekyll HTML partials
├── _config.yml              # Jekyll configuration
├── assets/                  # style.css, main.js
├── images/                  # Post thumbnails and diagrams
├── index.html               # Blog homepage template
├── Gemfile                  # Ruby dependencies
│
├── content/                 # Article working directory (one folder per article)
│   └── {slug}/
│       ├── STATUS.md        # Progress checklist
│       ├── brainstorm.md    # Ideas and AI discussion notes
│       ├── outline.md       # Article outline
│       ├── draft-cn.md      # Chinese draft
│       ├── draft-en.md      # English draft
│       └── video/           # Video production (post-publication)
│           ├── script.md
│           ├── audio/       # edge-tts output (gitignored)
│           └── remotion/    # Remotion project (gitignored)
│
├── .github/
│   ├── copilot-instructions.md   # GitHub Copilot project instructions
│   ├── prompts/                  # Reusable AI prompt files
│   │   ├── new-article.prompt.md
│   │   ├── translate-cn-to-en.prompt.md
│   │   ├── article-to-video-script.prompt.md
│   │   └── generate-remotion-project.prompt.md
│   ├── instructions/             # Context-specific AI instructions
│   │   ├── blog-writing.instructions.md
│   │   └── video-production.instructions.md
│   └── workflows/
│       └── jekyll.yml            # GitHub Actions: build & deploy
│
├── docs/
│   ├── workflow.md               # Full ideation → video workflow
│   ├── naming-conventions.md     # File/folder naming rules
│   ├── deployment.md             # GitHub Pages deployment guide
│   └── troubleshooting/
│       ├── remotion-setup-issues.md
│       └── remotion-setup-checklist.md
│
├── docker-compose.yml
├── Dockerfile
├── verify-local.sh
└── .gitignore
```

---

## Writing a New Article

See [docs/workflow.md](docs/workflow.md) for the full end-to-end workflow.

**Short version:**
1. Start with `.github/prompts/new-article.prompt.md` → creates `content/{slug}/`
2. Iterate CN draft → `content/{slug}/draft-cn.md`
3. Translate to EN → `content/{slug}/draft-en.md`
4. Publish → `_posts/YYYY-MM-DD-{slug}-en.md`

---

## Naming Conventions

See [docs/naming-conventions.md](docs/naming-conventions.md).

TL;DR — kebab-case everywhere, no spaces, no underscores.

---

## Deployment

Push to `main` → GitHub Actions builds and deploys to GitHub Pages automatically.

Details: [docs/deployment.md](docs/deployment.md)
