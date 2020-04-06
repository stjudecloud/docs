#!/usr/bin/env bash
set -e

# Write the commit hash to the config file.
COMMIT_HASH=$(git log --pretty=format:'%h' -n 1)
echo "  commit_hash: \"$COMMIT_HASH\"" >> mkdocs.yml

# Compile the HTML.
if ! mkdocs build; then
    echo "Building the HTML failed! This requires investigation."
    exit 1
fi