#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "Stopping containers..."
docker compose down -v

echo "Removing nginx config..."
sudo rm -f /etc/nginx/sites-enabled/admin-tools
sudo nginx -t && sudo systemctl reload nginx

echo ""
echo "Done. Admin tools removed."
echo "To also delete this directory: rm -rf $SCRIPT_DIR"
