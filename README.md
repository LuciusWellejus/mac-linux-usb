# mac-linux-usb
# My M2 Mac Linux Environment (USB-C Drive Setup)

This repository documents the comprehensive configuration and deployment steps for a custom Linux development environment. The entire operating system resides within a UTM Virtual Machine stored on an external 128 GB USB-C flash drive, ensuring the internal storage of the host M2 MacBook Air remains unaffected.

## System Architecture and Components
- Host Operating System: macOS (Apple Silicon M2, 8GB RAM)
- Hypervisor: UTM (Utilizing Apple Virtualization Framework)
- Guest Operating System: Arch Linux ARM64 (aarch64)
- Window Manager: Hyprland (Wayland Compositor)
- Security and Locking: Hyprlock
- Status Panel: Waybar
- Primary Editors: Zed (Graphical User Interface) and Neovim with LazyVim (Terminal)
- Web Browser: Zen Browser (Privacy-focused Firefox fork)

---

## Installation and Deployment Guide

### Step 1: Prepare the Host Machine (macOS)
Complete these preparation steps on macOS before the physical USB-C storage drive arrives:
1. Download and install UTM from mac.getutm.app.
2. Download and install Zen Browser from zen-browser.app to serve as the primary privacy-oriented web browser.
3. Download the official Arch Linux ARM64 ISO image suitable for virtualized Apple Silicon environments.

### Step 2: Configure the USB-C Virtual Machine in UTM
1. Connect the 128 GB USB-C flash drive to the Mac.
2. Launch UTM, select Create a New Virtual Machine, choose Virtualize, and then select Linux.
3. When prompted for the storage path, explicitly select a directory on the external USB-C drive.
4. Allocate system hardware resources:
   - Memory (RAM): Allocate between 3072 MB and 4096 MB to maintain operational stability on an 8GB host system.
   - CPU Cores: Allocate 4 cores.
5. Mount the downloaded Arch Linux ARM64 ISO file as a boot drive and start the virtual machine.

### Step 3: Base Arch Linux Operating System Installation
Once the system boots into the live Arch terminal environment, initiate the guided installation system by running:
```bash
archinstall
```
Follow the configuration prompts to establish the core system parameters:
- Create the primary user accounts, administrative access, and passwords.
- Select Systemd-boot as the system bootloader.
- Choose the Minimal system profile to prevent the installation of unnecessary desktop packages, allowing a clean manual build.
- Conclude the script, shut down the system, unmount the installation ISO, and boot into the new installation.

### Step 4: Install Hyprland and Interface Utilities
Log into the fresh Arch Linux installation and run the package manager to fetch the Wayland compositor, status indicators, and display security tools:
```bash
sudo pacman -Syu
sudo pacman -S hyprland waybar hyprlock kitty rofi-wayland fastfetch git
```
Note regarding authentication access: Hyprlock will be configured via user profile initialization or a system display manager to ensure secure lock-screen activation immediately upon system startup.

### Step 5: Initialize Development Environments (Zed and Neovim)
The system utilizes two distinct editing platforms: Zed for project-wide graphical workspace management, and Neovim for efficient, terminal-based keyboard workflows.

#### Installing Zed
```bash
sudo pacman -S zed
```

#### Installing Neovim and the LazyVim Framework
1. Install Neovim alongside the necessary compilation and source management dependencies:
   ```bash
   sudo pacman -S neovim git base-devel unzip
   ```
2. Install a compatible Nerd Font to ensure system glyphs, file indicators, and interface icons render accurately:
   ```bash
   sudo pacman -S ttf-jetbrains-mono-nerd
   ```
3. Deploy the LazyVim starter configuration template into the terminal configurations path:
   ```bash
   # Back up any pre-existing configurations to avoid conflicts
   mv ~/.config/nvim ~/.config/nvim.bak
   
   # Clone the production template deployment files
   git clone https://github.com ~/.config/nvim
   
   # Launch Neovim to trigger the automated plugin installation routine
   nvim
   ```

---

## Graphical Customization and Environment Tweak Targets
- Terminal Emulator: Kitty, configured with 85% opacity to enable background wallpaper visibility behind terminal text workspaces.
- Panel Monitoring: Waybar configured to present structural metrics including remaining memory allocations, system battery health, and system clock cycles.
- Welcome Script: Fastfetch environment script initialized to execute automatically inside every newly spawned shell interface.
