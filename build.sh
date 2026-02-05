#!/bin/bash
set -e

echo "=== LineageOS Port Build Started ==="

# Create working dirs
mkdir -p work out

cd work

echo "[1/3] Downloading LineageOS GSI..."
wget -q --show-progress \
https://github.com/phhusson/treble_experimentations/releases/download/v414/system-squeak-arm64-ab-gapps.img.xz

echo "[2/3] Extracting GSI..."
xz -d system-squeak-arm64-ab-gapps.img.xz

echo "[3/3] GSI ready:"
ls -lh system-squeak-arm64-ab-gapps.img

echo "=== Phase 1 completed successfully ==="
