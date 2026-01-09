#!/bin/bash

set -e
cd "$(dirname $0)"

source src/homebrew.sh
source src/shell.sh
source src/config.sh
source src/nodejs.sh

echo ""
echo "Setup completed successfully!"
echo "Please restart your computer to ensure all changes take effect."
