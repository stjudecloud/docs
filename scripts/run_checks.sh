#!/bin/bash

function format_tables() {
  pnpm markdown-table-formatter $1
  git add $1
}

function lint() {
  pnpm markdownlint-cli2 $1
}

function check_spelling() {
  pnpm mdspell --ignore-numbers --ignore-acronyms --en-us --no-suggestions --report $1
}

git diff --staged --name-only | while read file; do
  if [[ $file =~ content.* ]] && test -f $file; then
    format_tables $file
    lint $file
    check_spelling $file
  fi
done
