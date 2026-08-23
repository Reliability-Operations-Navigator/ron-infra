#!/bin/bash
BACKUP_DIR="/mnt/dr-pendrive/tfstate-backups"
if mountpoint -q /mnt/dr-pendrive; then
  mkdir -p "$BACKUP_DIR"
  cp terraform.tfstate "$BACKUP_DIR/tfstate-$(date +%Y%m%d-%H%M%S).bak"
  ls -t "$BACKUP_DIR"/tfstate-*.bak | tail -n +4 | xargs -r rm --
  echo "State backed up. Keeping last 3 copies."
else
  echo "Pendrive not mounted — skipping."
fi
