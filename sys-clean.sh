#!/bin/bash
set -e

echo "=== Starting Deep System Cleanup ==="

# Vacuum systemd journal logs
echo "[1/3] Vacuuming journalctl logs older than 3 days..."
sudo journalctl --vacuum-time=3d

# Clear cache directories
echo "[2/3] Clearing user cache and thumbnail directories..."
rm -rf ~/.cache/thumbnails/* 2>/dev/null || true
sudo rm -rf /tmp/* 2>/dev/null || true

# Truncate large log files in /var/log
echo "[3/3] Truncating oversized log files..."
sudo find /var/log -type f -name "*.log" -exec truncate -s 0 {} +

echo "✅ Cleanup finished! Free space:"
df -h /
