#!/bin/bash
set -e

if [ ! -f .env ]; then
    cp .env.example .env
    echo ">>> Created .env from .env.example"
    echo ">>> Edit .env to set ALLOWED_IP, GRAFANA_PASSWORD, etc."
    echo ">>> Then run: docker compose up -d"
    exit 0
fi

docker compose up -d

IP=$(grep ALLOWED_IP .env | cut -d= -f2)
echo ""
echo "=== Admin tools running ==="
echo "  Portainer:       http://<server-ip>/portainer/"
echo "  Redis Commander: http://<server-ip>/redis/"
echo "  Prometheus:      http://<server-ip>/prometheus/"
echo "  Grafana:         http://<server-ip>/grafana/"
echo ""
echo "  Allowed IP: $IP"
echo "  Grafana login: see GRAFANA_USER/GRAFANA_PASSWORD in .env"
