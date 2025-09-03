# Dotfiles

Personal configuration files backup.

## Contents

-   `home/` - Files that mirror home directory structure
    -   `.claude/`
        -   `commands/` - Claude Code custom commands
        -   `CLAUDE.md` - Claude Code instructions
    -   `.config/`
        -   `karabiner/assets/complex_modifications/` - Keyboard customizations
    -   `.gitconfig` - Git configuration
    -   `.zshrc` - Zsh shell configuration

## Installation

```bash
# Clone repository
git clone https://github.com/TempusGPT/.dotfiles ~/.dotfiles

# Create necessary directories
mkdir -p ~/.claude ~/.config/karabiner/assets

# Create all symlinks
ln -s ~/.dotfiles/home/.claude/commands ~/.claude/commands
ln -s ~/.dotfiles/home/.claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -s ~/.dotfiles/home/.config/karabiner/assets/complex_modifications ~/.config/karabiner/assets/complex_modifications
ln -s ~/.dotfiles/home/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/home/.zshrc ~/.zshrc
```
