#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract current working directory
cwd=$(echo "$input" | jq -r '.workspace.current_dir')

# Get username and hostname
user=$(whoami)
host=$(hostname -s)

# Check if we're in a git repository and get the branch
# Use --no-optional-locks to avoid lock contention
git_branch=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    git_branch=$(printf ' \033[00m(\033[01;33m%s\033[00m)' "$branch")
  fi
fi

# Print the status line with colors:
# - Green for user@host
# - Blue for directory
# - Yellow for git branch (if present)
printf '\033[01;32m%s@%s\033[00m:\033[01;34m%s\033[00m%s' "$user" "$host" "$cwd" "$git_branch"
