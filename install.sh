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

echo "Configuration deployment finalized successfully."
