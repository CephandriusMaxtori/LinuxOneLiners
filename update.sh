#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "=== Starting Raspberry Pi Update Process ==="

# 1. Update package lists
echo "[1/4] Updating package lists..."
sudo apt update

# 2. Upgrade all installed packages automatically
echo "[2/4] Upgrading installed packages..."
sudo apt full-upgrade -y

# 3. Clean up unnecessary files and cached packages
echo "[3/4] Cleaning up orphaned packages and cache..."
sudo apt autoremove -y
sudo apt clean

# 4. Reboot system
echo "[4/4] Update complete! Rebooting in 5 seconds... Press Ctrl+C to cancel."
sleep 5
sudo reboot
