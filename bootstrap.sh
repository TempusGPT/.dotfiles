#!/bin/bash

set -e
cd "$(dirname $0)"

source src/brew.sh
source src/zsh.sh
source src/link.sh
source src/node.sh

echo ""
echo "Setup completed successfully!"
echo "Please restart your computer to ensure all changes take effect."
