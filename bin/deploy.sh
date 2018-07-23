#!/usr/bin/env bash
# Base from https://gist.github.com/domenic/ec8b0fc8ab45f39403dd
set -e

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"

if [[ "$TRAVIS_PULL_REQUEST" != "false" || "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]]; then
    echo "Skipping deploy..."
    exit 0
fi

# Decrypt SSL cert.
openssl aes-256-cbc -K $encrypted_b6aa36d391e8_key -iv $encrypted_b6aa36d391e8_iv -in encrypted/SJCloudDeploy.enc -out ~/SJCloudDeploy -d
chmod 600 ~/SJCloudDeploy
eval `ssh-agent -s`
ssh-add ~/SJCloudDeploy

# Compile the HTML.
if ! mkdocs build; then
    echo "Building the HTML failed! This requires investigation."
    exit 1
fi

OUT_DIR="$HOME/Out"
BUILD_DIR="`pwd`/site"
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`

# Clone the repo.
git clone $REPO $OUT_DIR
cd $OUT_DIR
git checkout $TARGET_BRANCH || git checkout --orphan $TARGET_BRANCH

# Clear out old gh-pages content.
rm -rf $OUT_DIR/**/* || exit 0
cp -R $BUILD_DIR/* $OUT_DIR/

export GIT_AUTHOR_NAME="Travis CI"
export GIT_AUTHOR_EMAIL=""
export GIT_COMMITTER_NAME="Clay McLeod"
export GIT_COMMITTER_EMAIL="clay.mcleod@stjude.org"

echo ""
echo "== Base Directory =="
ls $BUILD_DIR/
echo ""
echo "== Static Files =="
find $BUILD_DIR/_static

# if git diff --quiet; then
#     echo "No changes to deploy."
#     exit 0
# fi

git add -A .
git commit -m "Automatic deploy to GitHub Pages: ${SHA}."
git push $SSH_REPO $TARGET_BRANCH
