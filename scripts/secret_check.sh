#!/usr/bin/env bash
# Simple secret scanner: looks for common secret patterns and fails if any found.
set -euo pipefail

echo "Running simple secret scan..."
hits=0

scan() {
  pattern="$1"
  desc="$2"
  matches=$(grep -RIn --exclude-dir=.git --exclude-dir=node_modules -E "$pattern" || true)
  if [ -n "$matches" ]; then
    echo "\n[SECRET SCAN] Potential $desc found:\n$matches\n"
    hits=1
  fi
}

# AWS Access Key
scan "AKIA[0-9A-Z]{16}" "AWS Access Key"
# Generic secret assignments
scan "(?i)(secret|password|passwd|api_key|apikey)\s*[:=]\s*['\"]?[^'\"\s]{8,}['\"]?" "likely secret assignment"
# Private key blocks
scan "-----BEGIN (RSA |EC )?PRIVATE KEY-----" "private key block"

if [ "$hits" -ne 0 ]; then
  echo "Secret scan failed: please remove secrets from files and use environment variables or a secret manager."
  exit 1
else
  echo "No obvious secrets found."
  exit 0
fi
