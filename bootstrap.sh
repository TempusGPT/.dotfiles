#!/bin/bash

set -euo pipefail
cd "$(dirname "$0")"

source macos/setup.sh
source homebrew/setup.sh
source karabiner/setup.sh
source zsh/setup.sh
source git/setup.sh
source node/setup.sh
source claude/setup.sh
source codex/setup.sh
source zed/setup.sh

echo ""
echo "Setup completed successfully!"
echo "Please restart your computer to ensure all changes take effect."
