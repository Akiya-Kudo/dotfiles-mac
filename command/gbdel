#!/bin/bash
if [ -z "$1" ]; then
        echo "Usage: git-delete-pattern-branches <pattern>"
        exit 1
fi
echo "Deleting branches matching pattern: '$1'"
git branch | grep "$1" | xargs git branch -D
