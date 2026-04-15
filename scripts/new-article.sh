#!/bin/bash
# Create a new article with directory structure and initial templates
# Usage: bash scripts/new-article.sh {slug}
# Example: bash scripts/new-article.sh mcp-vs-cli

set -e

if [ -z "$1" ]; then
  echo "Error: Article slug is required"
  echo "Usage: bash scripts/new-article.sh {slug}"
  echo "Example: bash scripts/new-article.sh mcp-vs-cli"
  exit 1
fi

SLUG=$1
ARTICLE_DIR="content/$SLUG"
TODAY=$(date +%Y-%m-%d)

# Check if article already exists
if [ -d "$ARTICLE_DIR" ]; then
  echo "Error: Article '$SLUG' already exists at $ARTICLE_DIR"
  exit 1
fi

echo "Creating new article: $SLUG"

# Create directories
mkdir -p "$ARTICLE_DIR/video"

# Create STATUS.md
cat > "$ARTICLE_DIR/STATUS.md" << EOF
# Article Status: $(echo $SLUG | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')

**Slug:** \`$SLUG\`
**Published:** —

## Status
- [ ] Brainstorm
- [ ] Outline
- [ ] Chinese draft
- [ ] English draft
- [ ] Published
- [ ] Video script
- [ ] Audio generated
- [ ] Remotion project

## Notes

EOF

# Create brainstorm.md
cat > "$ARTICLE_DIR/brainstorm.md" << 'EOF'
# Brainstorm: Article Title

## Topic
[Describe the main topic here]

## Target Audience
Senior .NET/cloud engineers who...

## Angles / Hooks (3-5 options)
1. Angle 1: [Why this matters]
2. Angle 2: [Different perspective]
3. Angle 3: [Contrarian take]

## Competitor / Reference Research
- Link/Article: [key insight]
- Link/Article: [key insight]

## Key Points to Cover
- [ ] Point 1
- [ ] Point 2
- [ ] Point 3

## "Aha!" Moment
What would make the reader feel like they've been doing it wrong?

## Series or Standalone?
- [ ] Single article (1500-1800 words)
- [ ] Part 1 of a series (2-3 parts planned)

## AI Discussion Notes
[Notes from ideation sessions with Copilot]
EOF

# Create outline.md
cat > "$ARTICLE_DIR/outline.md" << 'EOF'
# Outline: Article Title

## Structure (target: 1500-1800 words)

### 1. Introduction (~150 words)
- Hook: [Opening statement or question]
- Problem statement: [What's the gap/issue?]
- Thesis: [What will we solve?]

### 2. Section 1: [Section Title] (~400 words)
- Key point 1
- Code example or diagram
- Key point 2

### 3. Section 2: [Section Title] (~400 words)
- Key point 1
- Code example or diagram
- Key point 2

### 4. Section 3: [Section Title] (~400 words)
- Key point 1
- Code example or diagram
- Key point 2

### 5. Conclusion (~150 words)
- Summary of key takeaways
- Call to action or next steps
- [Optional] Related articles link

---

## Images/Diagrams Needed
- [ ] Diagram 1: [Description]
- [ ] Diagram 2: [Description]
EOF

# Create video/script.md placeholder
cat > "$ARTICLE_DIR/video/script.md" << 'EOF'
# Video Script: Article Title

[To be created after article is published]

---

## Scenes

[SCENE: Title card]


[SCENE: ]

EOF

echo "✓ Created directory: $ARTICLE_DIR"
echo "✓ Created: STATUS.md, brainstorm.md, outline.md, video/script.md"
echo ""
echo "Next steps:"
echo "1. Edit brainstorm.md to outline your initial thoughts"
echo "2. Use .github/prompts/new-article.prompt.md with Copilot to refine ideas"
echo "3. Iterate outline.md until structure is solid"
echo "4. Start writing draft-cn.md when ready"
echo ""
echo "Quick links:"
echo "  Docs:  docs/workflow.md, docs/naming-conventions.md"
echo "  Guide: .github/copilot-instructions.md"
