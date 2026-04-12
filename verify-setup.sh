#!/bin/bash
# Quick verification script for blog setup

echo "=== Blog Setup Verification ==="
echo ""

# Check directory structure
echo "✓ Checking directory structure..."
for dir in published images _layouts .github/workflows; do
    if [ -d "$dir" ]; then
        echo "  ✓ $dir/ exists"
    else
        echo "  ✗ $dir/ missing"
    fi
done

echo ""
echo "✓ Checking configuration files..."
for file in _config.yml Gemfile index.html .gitignore; do
    if [ -f "$file" ]; then
        echo "  ✓ $file exists"
    else
        echo "  ✗ $file missing"
    fi
done

echo ""
echo "✓ Checking published articles..."
article_count=$(find published -name "*.md" -type f | wc -l)
echo "  Found $article_count published articles"

echo ""
echo "✓ Checking GitHub Actions workflow..."
if [ -f ".github/workflows/jekyll.yml" ]; then
    echo "  ✓ GitHub Actions workflow configured"
else
    echo "  ✗ GitHub Actions workflow missing"
fi

echo ""
echo "=== Verification Complete ==="
echo ""
echo "To build locally with Docker, run:"
echo "  docker-compose up"
echo ""
echo "Then visit: http://localhost:4000/blog"
