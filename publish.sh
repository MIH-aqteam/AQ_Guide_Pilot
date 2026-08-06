#!/bin/bash

set -e

clear

echo "=================================================="
echo "    AQ eREPORTING GUIDE - PUBLISH TO GITHUB"
echo "=================================================="
echo

echo "Building documentation into docs/..."
echo

rm -rf docs

python3 -m sphinx \
    -W \
    --keep-going \
    -E \
    -a \
    -b html \
    source \
    docs

echo
echo "✓ Build completed successfully (no warnings)."
echo

git status --short

echo
echo "--------------------------------------------------"
read -p "Commit message: " COMMITMSG

if [ -z "$COMMITMSG" ]; then
    echo
    echo "❌ No commit message entered. Publication cancelled."
    exit 1
fi

echo
echo "Staging files..."
git add -A

echo "Creating commit..."
git commit -m "$COMMITMSG"

echo
echo "Pushing to personal GitHub..."
git push origin main

echo
echo "=================================================="
echo "✓ Publication completed successfully."
echo
echo "Repository : https://github.com/MIH-aqteam/AQ_Guide_Pilot"
echo "Website    : https://mih-aqteam.github.io/AQ_Guide_Pilot/"
echo
echo "GitHub Pages is now deploying the updated website."
echo "=================================================="
