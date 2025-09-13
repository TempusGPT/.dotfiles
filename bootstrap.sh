#!/bin/bash

set -e
cd "$(dirname $0)"/src

source macos.sh
source homebrew.sh
source oh-my-zsh.sh
source nodejs.sh
source claude.sh
source codex.sh
source config.sh

echo ""
echo "Setup completed successfully!"
echo "Please restart your computer to ensure all changes take effect."
