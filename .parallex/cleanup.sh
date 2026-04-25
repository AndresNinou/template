#!/usr/bin/env bash
# Runs in the agent's worktree AFTER the coding agent's final turn.
# This template repo is a test fixture — every workspace is throwaway, so
# cleanup is mostly informational. Don't `git reset --hard` here: that would
# nuke the agent's commits, which are the very thing the test is verifying.
set -uo pipefail

echo "── post-agent summary ──────────────────────────────────────────────"

echo "git log (agent commits since branch point):"
default_branch=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null \
                 | sed 's@^refs/remotes/origin/@@' || echo main)
git log --oneline "origin/${default_branch}..HEAD" 2>/dev/null || true

echo
echo "git diff --stat (agent changes vs ${default_branch}):"
git diff --stat "origin/${default_branch}...HEAD" 2>/dev/null || true

echo
echo "git status (uncommitted changes still in worktree):"
git status --short

# Stop any dev server the agent started (port from .dev-ports.json or 5173 default)
if [ -f .dev-ports.json ]; then
  port=$(grep -oE '"frontend":\s*[0-9]+' .dev-ports.json | grep -oE '[0-9]+' | head -1)
else
  port=5173
fi
if [ -n "${port:-}" ] && command -v fuser >/dev/null 2>&1; then
  if fuser -k "${port}/tcp" 2>/dev/null; then
    echo "stopped dev server on :${port}"
  fi
fi

echo "✓ template cleanup done"
