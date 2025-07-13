# Dotfiles

Personal configuration files backup.

## Contents

-   `home/` - Files that mirror home directory structure
    -   `.gitconfig` - Git configuration
    -   `.zshrc` - Zsh shell configuration
    -   `.claude/` - Claude Code configuration
        -   `CLAUDE.md` - Global instructions
        -   `commands/commit.md` - Custom commit command
    -   `.config/`
        -   `git/ignore` - Global git ignore patterns
        -   `karabiner/assets/complex_modifications/` - Keyboard customizations

## Installation

```bash
# Clone repository
git clone https://github.com/TempusGPT/dotfiles ~/.dotfiles

# Create necessary directories
mkdir -p ~/.claude ~/.config/git ~/.config/karabiner/assets

# Create all symlinks
ln -s ~/.dotfiles/home/.claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -s ~/.dotfiles/home/.claude/commands ~/.claude/commands
ln -s ~/.dotfiles/home/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/home/.zshrc ~/.zshrc
ln -s ~/.dotfiles/home/.config/git/ignore ~/.config/git/ignore
ln -s ~/.dotfiles/home/.config/karabiner/assets/complex_modifications ~/.config/karabiner/assets/complex_modifications
```
