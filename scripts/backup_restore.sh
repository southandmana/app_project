#!/usr/bin/env bash
# Simple backup and restore helper (file-based example)
set -euo pipefail

CMD=${1:-help}
BACKUP_DIR="./backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

usage() {
  echo "Usage: $0 backup|restore <source-file> [backup-name]"
}

mkdir -p "$BACKUP_DIR"

if [ "$CMD" = "backup" ]; then
  src=${2:-}
  if [ -z "$src" ]; then usage; exit 2; fi
  dest="$BACKUP_DIR/$(basename $src).$TIMESTAMP.bak"
  cp -a "$src" "$dest"
  echo "Backed up $src -> $dest"
  exit 0
fi

if [ "$CMD" = "restore" ]; then
  src=${2:-}
  if [ -z "$src" ]; then usage; exit 2; fi
  backup_name=${3:-}
  if [ -z "$backup_name" ]; then
    echo "Available backups for $src:";
    ls -1 "$BACKUP_DIR/$(basename $src).*" || true
    exit 0
  fi
  cp -a "$BACKUP_DIR/$backup_name" "$src"
  echo "Restored $backup_name -> $src"
  exit 0
fi

usage
exit 1
