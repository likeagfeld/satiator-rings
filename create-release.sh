#!/bin/bash
# PowerRings Release Packager
# Creates a ready-to-use ZIP file for Satiator

set -e

VERSION="1.0.0"
RELEASE_NAME="PowerRings-v${VERSION}"
RELEASE_DIR="releases/${RELEASE_NAME}"

echo "======================================"
echo "  PowerRings Release Packager"
echo "======================================"
echo ""

# Create release directory
mkdir -p "${RELEASE_DIR}"

# Copy SD folder
echo "📦 Packaging SD card contents..."
cp -r SD/* "${RELEASE_DIR}/"

# Copy documentation
echo "📚 Adding documentation..."
cp README.md "${RELEASE_DIR}/"
cp QUICKSTART.md "${RELEASE_DIR}/"
cp COMPLETION_SUMMARY.md "${RELEASE_DIR}/" 2>/dev/null || true

# Create a simple installation guide
cat > "${RELEASE_DIR}/INSTALL.txt" << 'EOF'
╔════════════════════════════════════════════════════════════╗
║              PowerRings Installation Guide                  ║
║          Sega Saturn Themed Satiator Menu System            ║
╚════════════════════════════════════════════════════════════╝

QUICK INSTALL (3 Steps):
────────────────────────────────────────────────────────────

1. FORMAT your SD card as FAT32

2. COPY everything from this folder to your SD card ROOT:
   - Copy satiator-powerrings/ folder
   - Copy ar_patched-satiator-powerrings.bin
   - Copy boot.desc

   Your SD card root should look like:
   ├── satiator-powerrings/
   ├── ar_patched-satiator-powerrings.bin
   └── boot.desc

3. INSERT SD card into Satiator and BOOT your Saturn!

────────────────────────────────────────────────────────────

WHAT YOU'LL SEE:
• Beautiful Sega Saturn blue theme (#003399)
• PowerRings branding throughout
• Same great Satiator Rings features

CONTROLS:
• D-Pad: Navigate
• A/C: Select
• B: Back
• L/R: Quick scroll
• Start: Options

THEMES:
Access Options menu to switch between:
- Default (Saturn Blue)
- Blue (Deep Blue)
- Dark (Dark Mode)

────────────────────────────────────────────────────────────

Need help? Check README.md or QUICKSTART.md

Enjoy PowerRings! 🪐✨
EOF

# Create ZIP file
echo "🗜️  Creating release archive..."
cd releases
zip -r "${RELEASE_NAME}.zip" "${RELEASE_NAME}/" -q
cd ..

echo ""
echo "✅ Release package created!"
echo ""
echo "📁 Location: releases/${RELEASE_NAME}.zip"
echo "📦 Ready to distribute!"
echo ""
echo "To use:"
echo "  1. Extract ${RELEASE_NAME}.zip"
echo "  2. Follow INSTALL.txt instructions"
echo "  3. Enjoy PowerRings on your Sega Saturn!"
echo ""
