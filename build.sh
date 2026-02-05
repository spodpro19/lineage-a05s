#!/bin/bash
set -e

# Create firmware folder
mkdir -p firmware

# Replace <FILE_ID> with your Google Drive file ID
FILE_ID="<YOUR_FILE_ID>"

# Download AP from Google Drive
curl -c /tmp/cookies "https://drive.google.com/uc?export=download&id=${FILE_ID}" > /dev/null
curl -L -b /tmp/cookies "https://drive.google.com/uc?export=download&confirm=$(awk '/download/ {print $NF}' /tmp/cookies)&id=${FILE_ID}" -o firmware/AP_A057F.tar.md5

echo "AP firmware downloaded successfully"
