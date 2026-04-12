#!/bin/bash
# Local Jekyll build verification script

set -e

echo "🔍 Checking Jekyll configuration..."
if [ ! -f "_config.yml" ]; then
    echo "❌ _config.yml not found"
    exit 1
fi
echo "✅ _config.yml found"

echo ""
echo "🔍 Checking for published articles..."
ARTICLE_COUNT=$(find published -name "*.md" -type f 2>/dev/null | wc -l || echo 0)
if [ "$ARTICLE_COUNT" -eq 0 ]; then
    echo "❌ No articles found in published/"
    exit 1
fi
echo "✅ Found $ARTICLE_COUNT published articles"

echo ""
echo "🔍 Checking Gemfile..."
if [ ! -f "Gemfile" ]; then
    echo "❌ Gemfile not found"
    exit 1
fi
echo "✅ Gemfile found"

echo ""
echo "🔍 Validating article frontmatter..."
for file in published/*.md; do
    if [ -f "$file" ]; then
        # Check if file starts with ---
        if ! head -1 "$file" | grep -q "^---"; then
            echo "❌ Missing frontmatter in $file"
            exit 1
        fi
        echo "  ✅ $(basename $file)"
    fi
done

echo ""
echo "🔍 Checking GitHub Actions workflow..."
if [ ! -f ".github/workflows/jekyll.yml" ]; then
    echo "❌ GitHub Actions workflow not found"
    exit 1
fi
echo "✅ GitHub Actions workflow configured"

echo ""
echo "✅ All verifications passed!"
echo ""
echo "Next steps:"
echo "1. Check https://github.com/DerekJi/blog/actions for the build status"
echo "2. Once successful, visit: https://derekji.github.io/blog/"
