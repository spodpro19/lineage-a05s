#!/bin/bash
set -e

echo "=== LineageOS Port | Phase 3 (Samsung A05s) ==="

# Load device config
source device/a05s/device.conf

echo "Target device: $DEVICE_NAME"
echo "Brand: $BRAND"
echo "Arch: $ARCH"
echo "Partition scheme: $PARTITION_SCHEME"
echo "SoC: $SOC"

mkdir -p work mnt
cd work

# Download GSI if missing
if [ ! -f system.img ]; then
  echo "[1/4] Downloading LineageOS GSI..."
  wget -q \
  https://github.com/phhusson/treble_experimentations/releases/download/v414/system-squeak-arm64-ab-gapps.img.xz

  echo "[2/4] Extracting..."
  xz -d system-squeak-arm64-ab-gapps.img.xz
  mv system-squeak-arm64-ab-gapps.img system.img
fi

echo "[3/4] Mounting system.img (read-only)"
sudo mount -o ro system.img ../mnt

echo "[4/4] Checking compatibility..."

SYSTEM_ARCH=$(grep ro.product.cpu.abi ../mnt/build.prop | head -n1)
SYSTEM_DEVICE=$(grep ro.product.device ../mnt/build.prop | head -n1)

echo "GSI ABI  : $SYSTEM_ARCH"
echo "GSI Device tag: $SYSTEM_DEVICE"

sudo umount ../mnt

echo "=== Phase 3 completed successfully ==="
