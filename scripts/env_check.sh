#!/usr/bin/env bash
# Simple environment checker for common developer tools.
set -euo pipefail

missing=0

check_cmd() {
  cmd=$1
  name=$2
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "MISSING: $name ($cmd)"
    missing=1
  else
    printf "OK: %s (%s) -> %s\n" "$name" "$cmd" "$($cmd --version 2>/dev/null || $cmd -v 2>/dev/null || echo 'version unknown')"
  fi
}

echo "Running basic environment checks..."

check_cmd git "Git"
check_cmd node "Node.js"
check_cmd npm "npm"
check_cmd python3 "Python 3"
check_cmd docker "Docker"

if [ $missing -ne 0 ]; then
  echo
  echo "One or more required tools are missing. See the README.dev_env.md for install steps or open the devcontainer for a consistent environment."
  exit 2
fi

echo "All checks passed. You're ready to proceed."
