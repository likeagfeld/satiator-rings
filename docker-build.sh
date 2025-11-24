#!/bin/bash
# PowerRings Docker Build Script

set -e

echo "========================================"
echo "PowerRings Cloud Build System"
echo "========================================"
echo ""

# Compiler should already be installed in the Docker image
if [ ! -d "$COMPILER_DIR/LINUX/bin" ]; then
    echo "ERROR: Compiler not found at $COMPILER_DIR/LINUX/bin"
    echo "The Docker image may not have built correctly."
    exit 1
fi
echo "✓ Compiler found at $COMPILER_DIR/LINUX/bin"

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
