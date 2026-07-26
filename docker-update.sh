#!/bin/bash
set -e

echo "=== Updating Docker Containers ==="

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed."
    exit 1
fi

echo "[1/3] Pulling updated image tags..."
docker compose pull || docker-compose pull

echo "[2/3] Re-creating updated containers..."
docker compose up -d || docker-compose up -d

echo "[3/3] Pruning unused images to save disk space..."
docker image prune -f

echo "✅ All Docker containers are up to date!"
