#!/usr/bin/env bash
set -euo pipefail

# Update this path if you renamed your pendrive volume label (e.g. /run/media/devops/TF_BACKUP/TF-backup)
BACKUP_DIR="/run/media/devops/8C67-1658/TF-backup"

if [ -d "$BACKUP_DIR" ]; then
    cp terraform.tfstate "$BACKUP_DIR/tfstate-$(date +%Y%m%d-%H%M%S).bak"
    
    # Retain only the 3 most recent backups
    ls -t "$BACKUP_DIR"/tfstate-*.bak 2>/dev/null | tail -n +4 | xargs -r rm --
    
    echo "Terraform state successfully backed up to $BACKUP_DIR"
else
    echo "Pendrive backup folder not found at $BACKUP_DIR — skipping."
fi
