#!/usr/bin/env bash
# Runs in the agent's worktree BEFORE the coding agent starts.
# Keep this fast — it blocks the spawn path.
set -euo pipefail

if [ -f package.json ] && [ ! -d node_modules ]; then
  echo "→ installing pnpm deps"
  pnpm install --frozen-lockfile --silent
fi

echo "✓ template ready"
