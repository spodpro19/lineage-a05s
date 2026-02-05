#!/bin/bash
set -e

echo "=== LineageOS Port | Phase 2 ==="

mkdir -p work out mnt
cd work

# Download GSI if not present
if [ ! -f system.img ]; then
  echo "[1/5] Downloading LineageOS GSI..."
  wget -q --show-progress \
  https://github.com/phhusson/treble_experimentations/releases/download/v414/system-squeak-arm64-ab-gapps.img.xz

  echo "[2/5] Extracting GSI..."
  xz -d system-squeak-arm64-ab-gapps.img.xz
  mv system-squeak-arm64-ab-gapps.img system.img
fi

echo "[3/5] Image info:"
file system.img
ls -lh system.img

echo "[4/5] Mounting system image (read-only)..."
sudo mount -o ro system.img ../mnt

echo "[5/5] Inspecting /system:"
ls ../mnt | head -n 20

echo "Build fingerprint:"
cat ../mnt/build.prop | grep ro.build.fingerprint || true

echo "Unmounting..."
sudo umount ../mnt

echo "=== Phase 2 completed successfully ==="
