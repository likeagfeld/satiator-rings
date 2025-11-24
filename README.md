# 🎮 PowerRings

**A Sega Saturn themed reskin of Satiator Rings**

PowerRings is a beautiful, Saturn-themed menu system for the Satiator ODE (Optical Drive Emulator) for Sega Saturn. This project is a complete rebrand of the original Satiator Rings with a fresh Sega Saturn aesthetic featuring the console's iconic blue and white color scheme.

## ✨ Features

- 🎨 **Sega Saturn Theme**: Iconic blue and white color scheme inspired by the legendary console
- 🚀 **PowerRings Branding**: Completely rebranded UI with new logo and graphics
- 🎯 **Easy to Use**: Same great Satiator Rings functionality with a fresh look
- 📦 **Drag & Drop**: Pre-compiled binaries ready to use - no compilation needed!
- 🐳 **Cloud Build**: Full Docker environment for easy compilation

## 🚀 Quick Start

### For Users (No Compilation Needed)

1. Download the latest release
2. Copy the `SD` folder contents to your SD card root
3. Insert SD card into your Satiator device
4. Boot your Sega Saturn - PowerRings will load!

### For Developers (Building from Source)

#### Using Docker (Recommended)
```bash
./quick-build.sh
```

Or manually:
```bash
docker-compose up --build
```

#### Manual Build
See [BUILD.md](BUILD.md) for detailed build instructions.

## 🎨 Themes

PowerRings includes three beautiful themes:

- **Default**: Classic Sega Saturn blue (#003399)
- **Blue**: Deep Saturn blue variant
- **Dark**: Sleek dark mode

You can switch themes from the Options menu in PowerRings!

## 📋 What Changed from Satiator Rings?

- ✅ Rebranded from "Rings" to "PowerRings"
- ✅ New Sega Saturn color scheme (blue/white instead of red)
- ✅ Updated all UI elements and graphics
- ✅ Updated directory structure (`satiator-powerrings`)
- ✅ Docker build environment for cloud compilation
- ✅ Simplified build process with helper scripts

## 🛠️ Technical Details

- **Platform**: Sega Saturn
- **Framework**: Jo Engine
- **Language**: C
- **Compiler**: SH-2 GCC cross-compiler
- **ODE**: Satiator

## 📁 Directory Structure

```
PowerRings/
├── SD/
│   └── satiator-powerrings/     # Main application directory
│       ├── gfx/                 # Graphics and fonts
│       ├── sfx/                 # Sound effects
│       ├── themes/              # UI themes
│       │   ├── default/         # Saturn blue theme
│       │   ├── blue/            # Deep blue theme
│       │   └── dark/            # Dark theme
│       └── ar/                  # Action Replay patches
├── Dockerfile                   # Docker build environment
├── docker-compose.yml          # Easy Docker builds
├── quick-build.sh              # One-command build script
└── BUILD.md                    # Detailed build guide
```

## 🎯 Usage

### Controls
- **D-Pad**: Navigate menus
- **A/C**: Select/Confirm
- **B**: Back/Cancel
- **Start**: Additional options
- **L/R Triggers**: Quick scroll

### Features
- Browse and launch games from SD card
- Per-game save management
- Theme customization
- Auto region patching
- Recent games history
- Favorites list

## 🤝 Credits

PowerRings is based on **Satiator Rings** by the original developers.

This reskin adds:
- Sega Saturn themed branding
- Updated color schemes
- Docker build environment
- Simplified build process

## 📜 License

This project maintains the same license as the original Satiator Rings project.
See source files for detailed copyright information.

## 🐛 Issues & Support

If you encounter any issues:
1. Check the [BUILD.md](BUILD.md) for build troubleshooting
2. Verify your SD card is formatted correctly (FAT32)
3. Ensure your Satiator firmware is up to date

## 🎉 Enjoy!

Boot up your Sega Saturn and enjoy PowerRings - the ultimate Satiator menu experience with iconic Saturn style!

---

*PowerRings - Bringing the power of Saturn to your game library* 🪐
