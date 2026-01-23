# Create necessary directories
mkdir -p ~/.codex
mkdir -p ~/.codex/skills
mkdir -p ~/.config/karabiner/assets/complex_modifications
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty

# Symlink configuration files
ln -snf ~/.dotfiles/config/.codex/AGENTS.md ~/.codex/AGENTS.md
ln -snf ~/.dotfiles/config/.codex/skills/git-master ~/.codex/skills/git-master
ln -snf ~/.dotfiles/config/.config/karabiner/assets/complex_modifications/rules.json ~/.config/karabiner/assets/complex_modifications/rules.json
ln -snf ~/.dotfiles/config/Library/Application\ Support/com.mitchellh.ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
ln -snf ~/.dotfiles/config/.gitconfig ~/.gitconfig
ln -snf ~/.dotfiles/config/.zprofile ~/.zprofile
ln -snf ~/.dotfiles/config/.zshrc ~/.zshrc
