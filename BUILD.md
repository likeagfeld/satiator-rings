# PowerRings Build Guide

## Cloud Build with Docker (Recommended)

The easiest way to build PowerRings is using the included Docker environment. This ensures all dependencies are correctly installed without modifying your system.

### Prerequisites
- Docker installed on your system
- Docker Compose (optional, for easier builds)

### Quick Build

#### Using Docker Compose (Easiest):
```bash
docker-compose up
```

This will:
1. Build the Docker image with all necessary tools
2. Compile PowerRings automatically
3. Generate the output files in the current directory

#### Using Docker directly:
```bash
# Build the Docker image
docker build -t powerrings-builder .

# Run the build
docker run -v $(pwd):/workspace powerrings-builder /usr/local/bin/build.sh
```

### Output Files

After a successful build, you'll find:
- `*.bin` - Compiled binary files
- `*.iso` / `*.cue` - CD image files
- `SD/` - SD card directory with all game files

### Running on Sega Saturn

1. Copy the entire `SD` folder contents to your SD card root
2. Insert SD card into your Satiator device
3. Boot your Sega Saturn - PowerRings will load automatically!

## Manual Build (Advanced)

If you prefer to build without Docker:

### Prerequisites
- Linux environment (Ubuntu 20.04+ recommended)
- SH-2 cross-compiler toolchain
- Jo Engine framework

### Steps
1. Install the SH-2 toolchain to `../../Compiler`
2. Clone Jo Engine to `../../jo_engine`
3. Run `./compile.sh`

## Customization

### Themes
Edit theme files in `SD/satiator-powerrings/themes/[theme-name]/theme.ini`

Colors are in RGB format (0-255):
```ini
[START]
font=0,51,153
bg=0,51,153
selector=100,180,255
boxbg=220,220,235
[END]
```

### Graphics
Replace TGA files in theme folders to customize the UI:
- `POWERRINGS.TGA` - Main logo
- `MENU.TGA`, `GAME.TGA`, `OPTION.TGA`, etc. - Menu headers

## Troubleshooting

### Docker build fails
- Ensure Docker has enough disk space (at least 5GB free)
- Try: `docker system prune` to clean up old images

### Compilation errors
- Make sure submodules are initialized: `git submodule update --init --recursive`
- Check that paths in makefile match your directory structure

## Support

For issues or questions, check the original Satiator Rings project documentation.

---
PowerRings - A Sega Saturn themed reskin of Satiator Rings
