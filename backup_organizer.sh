#!/bin/bash

# USB-C Storage Initialization Script
echo "Initiating USB storage structure setup..."

# Create Local AI Model repository path
echo "Creating AI Models directory..."
mkdir -p "AI_Models"

# Create E-Book and Document repository path
echo "Creating Calibre Library directory..."
mkdir -p "Calibre_Library"

# Create Markdown Knowledge Base path
echo "Creating Obsidian Vault directory..."
mkdir -p "Obsidian_Vault"

# Create file archive pillars based on the P.A.R.A method
echo "Creating P.A.R.A archive pillars..."
mkdir -p "01_Projects"
mkdir -p "02_Areas"
mkdir -p "03_Resources"
mkdir -p "04_Archives"

echo "Storage structure deployed successfully."
