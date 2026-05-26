#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export BUILD_OUTPUT_DIR="$ROOT_DIR/netlify-deploy"
export BUILD_ZIP_PATH="$ROOT_DIR/netlify-deploy.zip"
export BUILD_ZIP=1

exec "$ROOT_DIR/build.sh"
