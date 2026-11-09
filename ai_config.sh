#!/bin/bash

# Configuration script to route Ollama AI models to the external USB-C drive
# Assumes the USB drive is formatted and named "LaunchPad"

DRIVE_PATH="/Volumes/LaunchPad"

if [ -d "$DRIVE_PATH" ]; then
    echo "USB-C storage drive detected at $DRIVE_PATH."
    
    # Create the target directory inside the USB folder structure if missing
    mkdir -p "$DRIVE_PATH/AI_Models"
    
    # Inject the environment variable path into your Mac profile configuration
    echo "Configuring persistent macOS environment variables..."
    echo "export OLLAMA_MODELS=\"$DRIVE_PATH/AI_Models\"" >> ~/.zshrc
    
    echo "Configuration successful. Restart your terminal application to apply changes."
else
    echo "Error: USB-C drive named 'LaunchPad' not found. Verify drive naming convention."
fi
