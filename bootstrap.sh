#!/bin/bash

set -e
cd "$(dirname $0)"

source src/macos.sh
source src/homebrew.sh
source src/git.sh
source src/zsh.sh
source src/node.sh
source src/karabiner.sh
source src/claude.sh
source src/codex.sh
source src/zed.sh

echo ""
echo "Setup completed successfully!"
echo "Please restart your computer to ensure all changes take effect."
