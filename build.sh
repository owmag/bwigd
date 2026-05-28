#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEPLOY_DIR="${BUILD_OUTPUT_DIR:-$ROOT_DIR/dist}"
ZIP_PATH="${BUILD_ZIP_PATH:-$ROOT_DIR/dist.zip}"

rm -rf "$DEPLOY_DIR"
mkdir -p "$DEPLOY_DIR/mazius-display-main/fonts"

cp "$ROOT_DIR/index.html" "$DEPLOY_DIR/"
cp "$ROOT_DIR/model.gltf" "$DEPLOY_DIR/"
cp "$ROOT_DIR/NoiGroteskTrial-Medium.ttf" "$DEPLOY_DIR/"
cp "$ROOT_DIR/Mattone-Black.woff2" "$DEPLOY_DIR/"
cp "$ROOT_DIR/Mattone-Black.otf" "$DEPLOY_DIR/"
cp "$ROOT_DIR/bwigd-text.svg" "$DEPLOY_DIR/"
cp "$ROOT_DIR/bwigd-favi.svg" "$DEPLOY_DIR/"
cp "$ROOT_DIR/favicon.ico" "$DEPLOY_DIR/"
cp "$ROOT_DIR/site.webmanifest" "$DEPLOY_DIR/"
cp "$ROOT_DIR/robots.txt" "$DEPLOY_DIR/"
cp "$ROOT_DIR/sitemap.xml" "$DEPLOY_DIR/"
cp "$ROOT_DIR/_headers" "$DEPLOY_DIR/"
cp -R "$ROOT_DIR/icons" "$DEPLOY_DIR/"
cp -R "$ROOT_DIR/gallery" "$DEPLOY_DIR/"
cp "$ROOT_DIR/mazius-display-main/fonts/MaziusDisplay-Regular.woff2" "$DEPLOY_DIR/mazius-display-main/fonts/"
cp "$ROOT_DIR/mazius-display-main/fonts/MaziusDisplay-Regular.woff" "$DEPLOY_DIR/mazius-display-main/fonts/"
cp "$ROOT_DIR/mazius-display-main/fonts/MaziusDisplay-Regular.otf" "$DEPLOY_DIR/mazius-display-main/fonts/"

python3 - "$DEPLOY_DIR" <<'PY'
from pathlib import Path
import sys

for path in Path(sys.argv[1]).rglob(".DS_Store"):
    path.unlink()
PY

if [[ "${BUILD_ZIP:-0}" == "1" ]]; then
  rm -f "$ZIP_PATH"
  (
    cd "$DEPLOY_DIR"
    zip -qr "$ZIP_PATH" . -x "*.DS_Store"
  )
  echo "Built $ZIP_PATH"
fi

echo "Built $DEPLOY_DIR"
