#!/bin/bash

# Configuration Deployment Script for mac-linux-usb
echo "Initiating configuration deployment..."

# Target configuration directory
TARGET_DIR="$HOME/.config"

# Create target directories if they do not exist
mkdir -p "$TARGET_DIR/hypr"
mkdir -p "$TARGET_DIR/kitty"

# Copy configurations from the repository clone to the local system
echo "Deploying Kitty terminal configurations..."
cp .config/kitty/kitty.conf "$TARGET_DIR/kitty/kitty.conf"

echo "Deploying Hyprland window manager configurations..."
cp .config/hypr/hyprland.conf "$TARGET_DIR/hypr/hyprland.conf"

echo "Deploying Hyprlock security configurations..."
cp .config/hypr/hyprlock.conf "$TARGET_DIR/hypr/hyprlock.conf"

# Install and enable Ollama locally inside Linux
echo "Installing Ollama AI engine inside Linux..."
sudo pacman -S ollama --noconfirm
sudo systemctl enable --now ollama

# Privacy & Security Layer: Install and configure UFW Firewall
echo "Deploying UFW Firewall and securing network ports..."
sudo pacman -S ufw --noconfirm
sudo systemctl enable --now ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

echo "Configuration deployment finalized successfully with security layers enabled."
