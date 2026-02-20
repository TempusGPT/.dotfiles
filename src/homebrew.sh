# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Initialize environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install packages from Brewfile
brew bundle
