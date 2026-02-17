#!/bin/bash
set -euo pipefail

# Only run in remote (Claude Code on the web) environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"

echo "=== Collaborate: Session Start ==="
echo "Setting up environment..."

# Install common tools if missing
if ! command -v make &>/dev/null; then
  echo "Installing make..."
  apt-get update -qq && apt-get install -y -qq make >/dev/null 2>&1
fi

# Auto-detect and install dependencies for any projects in the workspace
# Supports: npm, pip, cargo, go, bundler

# Node.js (package.json)
find "$PROJECT_DIR" -name "package.json" -not -path "*/node_modules/*" -maxdepth 3 | while read -r pkg; do
  dir=$(dirname "$pkg")
  echo "Found Node project: $dir"
  (cd "$dir" && npm install --no-audit --no-fund 2>&1) || echo "Warning: npm install failed in $dir"
done

# Python (requirements.txt)
find "$PROJECT_DIR" -name "requirements.txt" -maxdepth 3 | while read -r req; do
  dir=$(dirname "$req")
  echo "Found Python project: $dir"
  pip install -q -r "$req" 2>&1 || echo "Warning: pip install failed for $req"
done

# Python (pyproject.toml)
find "$PROJECT_DIR" -name "pyproject.toml" -maxdepth 3 | while read -r toml; do
  dir=$(dirname "$toml")
  echo "Found Python project (pyproject): $dir"
  (cd "$dir" && pip install -q -e "." 2>&1) || echo "Warning: pip install failed in $dir"
done

# Go (go.mod)
find "$PROJECT_DIR" -name "go.mod" -maxdepth 3 | while read -r gomod; do
  dir=$(dirname "$gomod")
  echo "Found Go project: $dir"
  (cd "$dir" && go mod download 2>&1) || echo "Warning: go mod download failed in $dir"
done

# Export useful env vars
echo "export COLLABORATE_DIR=\"$PROJECT_DIR\"" >> "$CLAUDE_ENV_FILE"

echo "=== Setup complete ==="
