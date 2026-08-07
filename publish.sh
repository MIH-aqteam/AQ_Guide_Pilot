#!/bin/bash
set -e

clear

EXPECTED_BRANCH="main"
EXPECTED_REMOTE="origin"
EXPECTED_REPO="MIH-aqteam/AQ_Guide_Pilot"

echo "============================================================"
echo "     AQ eREPORTING GUIDE — PILOT PUBLICATION"
echo "============================================================"
echo
echo "Destination:"
echo "  Personal GitHub repository"
echo "  $EXPECTED_REPO"
echo
echo "This script will:"
echo "  1. Verify the Git repository and publication destination"
echo "  2. Build the Sphinx documentation"
echo "  3. Verify that the build completes WITHOUT warnings"
echo "  4. Show all changes"
echo "  5. Create a Git commit"
echo "  6. Push main to the personal GitHub repository"
echo
echo "Because Sphinx is executed with the -W option,"
echo "ANY warning is treated as an error."
echo
echo "If warnings are detected, publication will stop"
echo "before any Git commit or push is performed."
echo
echo "Nothing has been changed yet."
echo
read -p "Press ENTER to begin verification, or Ctrl-C to abort."

echo
echo "------------------------------------------------------------"
echo "1. VERIFYING REPOSITORY"
echo "------------------------------------------------------------"
echo

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "❌ This directory is not a Git repository."
    echo "Publication cancelled."
    exit 1
fi

CURRENT_BRANCH=$(git branch --show-current)

echo "Current branch : $CURRENT_BRANCH"

if [ "$CURRENT_BRANCH" != "$EXPECTED_BRANCH" ]; then
    echo
    echo "❌ Publication must be performed from branch '$EXPECTED_BRANCH'."
    echo "Current branch is '$CURRENT_BRANCH'."
    echo "Publication cancelled."
    exit 1
fi

if ! git remote get-url "$EXPECTED_REMOTE" >/dev/null 2>&1; then
    echo
    echo "❌ Git remote '$EXPECTED_REMOTE' does not exist."
    echo "Publication cancelled."
    exit 1
fi

REMOTE_URL=$(git remote get-url "$EXPECTED_REMOTE")

echo "Remote         : $EXPECTED_REMOTE"
echo "Remote URL     : $REMOTE_URL"

if [[ "$REMOTE_URL" != *"$EXPECTED_REPO"* ]]; then
    echo
    echo "❌ SAFETY CHECK FAILED."
    echo
    echo "Remote '$EXPECTED_REMOTE' does not point to:"
    echo "  $EXPECTED_REPO"
    echo
    echo "Actual remote:"
    echo "  $REMOTE_URL"
    echo
    echo "Publication cancelled."
    exit 1
fi

if git diff --name-only --diff-filter=U | grep -q .; then
    echo
    echo "❌ Unresolved Git merge conflicts detected."
    echo "Resolve them before publishing."
    exit 1
fi

echo
echo "✓ Repository verification successful."
echo
echo "Publication destination:"
echo "  $REMOTE_URL"
echo
read -p "Press ENTER to continue to the Sphinx build, or Ctrl-C to abort."

echo
echo "------------------------------------------------------------"
echo "2. BUILDING DOCUMENTATION"
echo "------------------------------------------------------------"
echo

echo "Removing previous docs/ build..."
rm -rf docs

echo
echo "Building documentation..."
echo

python3 -m sphinx \
    -W \
    --keep-going \
    -E \
    -a \
    -b html \
    source \
    docs

touch docs/.nojekyll

echo
echo "✓ Build completed successfully."
echo
echo "No warnings were detected."
echo "The documentation is eligible for publication."

echo
echo "------------------------------------------------------------"
echo "3. REVIEWING CHANGES"
echo "------------------------------------------------------------"
echo

git status --short

echo

if git diff --quiet && git diff --cached --quiet && \
   [ -z "$(git ls-files --others --exclude-standard)" ]; then
    echo "No changes detected."
    echo
    echo "There is nothing to publish."
    exit 0
fi

echo "The files listed above will be included in the publication."
echo
read -p "Stage ALL these changes? [y/N] " CONFIRM_STAGE

if [[ "$CONFIRM_STAGE" != "y" && "$CONFIRM_STAGE" != "Y" ]]; then
    echo
    echo "Publication cancelled. No files were staged."
    exit 0
fi

git add -A

echo
echo "Files staged for commit:"
echo
git status --short

echo
echo "------------------------------------------------------------"
echo "4. CREATING COMMIT"
echo "------------------------------------------------------------"
echo

read -p "Commit message: " COMMITMSG

if [ -z "$COMMITMSG" ]; then
    echo
    echo "❌ No commit message entered."
    echo "Publication cancelled before commit."
    exit 1
fi

echo
echo "About to create commit:"
echo
echo "  $COMMITMSG"
echo
read -p "Create this commit? [y/N] " CONFIRM_COMMIT

if [[ "$CONFIRM_COMMIT" != "y" && "$CONFIRM_COMMIT" != "Y" ]]; then
    echo
    echo "Commit cancelled."
    echo
    echo "Note: files remain staged."
    exit 0
fi

git commit -m "$COMMITMSG"

echo
echo "✓ Commit created successfully."
echo
git --no-pager log -1 --oneline

echo
echo "------------------------------------------------------------"
echo "5. FINAL PUBLICATION CHECK"
echo "------------------------------------------------------------"
echo

echo "You are about to publish:"
echo
echo "  Repository : $EXPECTED_REPO"
echo "  Remote     : $EXPECTED_REMOTE"
echo "  Branch     : $EXPECTED_BRANCH"
echo "  Commit     : $(git log -1 --oneline)"
echo
echo "Command:"
echo
echo "  git push $EXPECTED_REMOTE $EXPECTED_BRANCH"
echo
echo "This will trigger GitHub Pages deployment on the"
echo "PERSONAL PILOT website."
echo

read -p "Publish to the PILOT repository now? [y/N] " CONFIRM_PUSH

if [[ "$CONFIRM_PUSH" != "y" && "$CONFIRM_PUSH" != "Y" ]]; then
    echo
    echo "Publication stopped before push."
    echo "The commit exists locally but has NOT been published."
    exit 0
fi

echo
echo "Pushing to personal GitHub..."
echo

git push "$EXPECTED_REMOTE" "$EXPECTED_BRANCH"

echo
echo "============================================================"
echo "✓ PILOT PUBLICATION COMPLETED SUCCESSFULLY"
echo "============================================================"
echo
echo "Repository:"
echo "  https://github.com/MIH-aqteam/AQ_Guide_Pilot"
echo
echo "Website:"
echo "  https://mih-aqteam.github.io/AQ_Guide_Pilot/"
echo
echo "GitHub Actions will now build and deploy the website."
echo
echo "Validate the pilot website before publishing to EEA."
echo
echo "When the pilot version has been validated, run:"
echo
echo "  ./publish_eea.sh"
echo
echo "============================================================"


