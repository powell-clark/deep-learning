#!/usr/bin/env bash
# Build the repo virtualenv used by the notebook verifier.
set -euo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO"
# --system-site-packages reuses the machine's torch/numpy rather than
# re-downloading ~2GB onto an already-full disk.
python3 -m venv --system-site-packages .venv
.venv/bin/pip install --quiet --upgrade pip
.venv/bin/pip install --quiet -r requirements.txt
echo "venv ready: $REPO/.venv"
