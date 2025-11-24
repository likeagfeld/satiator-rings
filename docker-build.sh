#!/bin/bash
# PowerRings Docker Build Script

set -e

echo "========================================"
echo "PowerRings Cloud Build System"
echo "========================================"
echo ""

# Check if compiler is installed
if [ ! -d "$COMPILER_DIR/LINUX/bin" ]; then
    echo "Installing Sega Saturn compiler toolchain..."
    echo "This will take 15-20 minutes on first build..."
    cd $COMPILER_DIR
    ./INSTALL_LINUX.sh
fi

# Navigate to project directory (the mounted volume will be at /home/user/satiator-rings)
cd /home/user/satiator-rings

# Clean previous builds
echo "Cleaning previous build artifacts..."
make clean 2>/dev/null || true

# Build the project
echo "Building PowerRings..."
export NCPU=$(nproc)
echo "Using $NCPU CPU cores..."
make -j${NCPU} all

# Build SD card image components
echo "Building SD card components..."
if [ -f "build_SD.bat" ]; then
    echo "Note: build_SD.bat detected but running on Linux"
    echo "Building emulate and AR patch components separately..."
fi

echo ""
echo "========================================"
echo "Build Complete!"
echo "========================================"
echo ""
echo "Output files:"
ls -lh *.bin *.iso *.cue 2>/dev/null || echo "No output files found"
echo ""
echo "SD Card files:"
find SD/ -type f -name "*.bin" -o -name "*.desc" 2>/dev/null || echo "No SD files found"
