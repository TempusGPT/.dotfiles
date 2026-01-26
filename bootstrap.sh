#!/bin/bash

set -e
cd "$(dirname $0)"

source src/homebrew.sh
source src/git.sh
source src/zsh.sh
source src/node.sh
source src/karabiner.sh
source src/opencode.sh
source src/ghostty.sh

echo ""
echo "Setup completed successfully!"
echo "Please restart your computer to ensure all changes take effect."
