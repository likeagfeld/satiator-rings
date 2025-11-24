#!/bin/bash
# PowerRings Quick Build Script
# This script simplifies the Docker build process

set -e

echo "╔════════════════════════════════════════╗"
echo "║      PowerRings Cloud Builder          ║"
echo "║   Sega Saturn Themed Menu System       ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Error: Docker is not installed!"
    echo "Please install Docker first: https://docs.docker.com/get-docker/"
    exit 1
fi

echo "✓ Docker found"
echo ""

# Check if docker-compose is available
if command -v docker-compose &> /dev/null; then
    echo "🚀 Building with Docker Compose..."
    docker-compose up --build
else
    echo "🚀 Building with Docker..."
    echo "Building Docker image..."
    docker build -t powerrings-builder .

    echo ""
    echo "Running build..."
    docker run --rm -v "$(pwd):/workspace" powerrings-builder /usr/local/bin/build.sh
fi

echo ""
echo "✅ Build process completed!"
echo ""
echo "📦 Output files:"
ls -lh *.bin *.iso *.cue 2>/dev/null || echo "   No output files found (check for errors above)"
echo ""
echo "📁 To use PowerRings:"
echo "   1. Copy the SD/ folder contents to your SD card root"
echo "   2. Insert into Satiator device"
echo "   3. Boot your Sega Saturn!"
echo ""
