#!/usr/bin/env bash
set -e

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"

if [[ "$TRAVIS_PULL_REQUEST" != "false" || "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]]; then
    echo "Skipping deploy..."
    exit 0
fi

# Decrypt deployment key from env variables.
echo "$DEPLOY_KEY" | base64 -d > /tmp/deploy_key
eval "$(ssh-agent -s)"
chmod 600 /tmp/deploy_key
ssh-add /tmp/deploy_key

# Setup for deployment
OUT_DIR="$HOME/gh-pages-new-copy"
BUILD_DIR="$PWD/site"
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`

# Clone the repo.
git clone $REPO $OUT_DIR 
cd $OUT_DIR
git checkout $TARGET_BRANCH || git checkout --orphan $TARGET_BRANCH

# Clear out old gh-pages content.
rm -rf $OUT_DIR/**/*
cp -R $BUILD_DIR/* $OUT_DIR/

export GIT_AUTHOR_NAME="St. Jude Cloud"
export GIT_AUTHOR_EMAIL="support@stjude.cloud"
export GIT_COMMITTER_NAME="Clay McLeod"
export GIT_COMMITTER_EMAIL="clay.mcleod@stjude.org"

if git diff --quiet; then
    echo "No changes to deploy."
    exit 0
fi

git add -A .
git commit -m "Automatic deploy to GitHub Pages: ${SHA}."
git push $SSH_REPO $TARGET_BRANCH