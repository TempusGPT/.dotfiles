# Dotfiles

Personal configuration files backup.

## Contents

-   `home/` - Files that mirror home directory structure
    -   `.claude/`
        -   `commands/` - Claude Code custom commands
        -   `CLAUDE.md` - Claude Code instructions
        -   `settings.json` - Claude Code settings
    -   `.config/`
        -   `karabiner/assets/complex_modifications/` - Keyboard customizations
    -   `.gitconfig` - Git configuration
    -   `.zprofile` - Zsh profile configuration
    -   `.zshrc` - Zsh shell configuration

## Installation

```bash
# Clone repository
git clone https://github.com/TempusGPT/.dotfiles ~/.dotfiles

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages from Brewfile
/opt/homebrew/bin/brew bundle --file="~/.dotfiles/Brewfile"

# Create necessary directories
mkdir -p ~/.claude
mkdir -p ~/.config/karabiner/assets

# Create all symlinks
ln -sf ~/.dotfiles/home/.claude/commands ~/.claude/commands
ln -sf ~/.dotfiles/home/.claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -sf ~/.dotfiles/home/.claude/settings.json ~/.claude/settings.json
ln -sf ~/.dotfiles/home/.config/karabiner/assets/complex_modifications/rules.json ~/.config/karabiner/assets/complex_modifications/rules.json
ln -sf ~/.dotfiles/home/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/home/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/home/.zshrc ~/.zshrc
```
