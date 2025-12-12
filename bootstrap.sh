#!/bin/bash

set -e
cd "$(dirname $0)"

source src/macos.sh
source src/homebrew.sh
source src/oh-my-zsh.sh
source src/config.sh
source src/nodejs.sh

echo ""
echo "Setup completed successfully!"
echo "Please restart your computer to ensure all changes take effect."
