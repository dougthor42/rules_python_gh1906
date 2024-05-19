#!/bin/bash

set -Eeuo pipefail

echo "Making venv"
python -m venv .venv
source .venv/bin/activate
echo "Installing 'uv'"
pip install uv
echo "Compiling requirements"
uv pip compile \
    --generate-hashes \
    --no-strip-extras \
    --emit-index-url \
    --output-file=requirements_lock.txt \
    requirements.in
deactivate
echo "Done"
