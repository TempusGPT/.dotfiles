# Create necessary directories
mkdir -p ~/.config/karabiner/assets/complex_modifications
mkdir -p ~/.config/opencode
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty

# Symlink configuration files
ln -snf ~/.dotfiles/config/.config/karabiner/assets/complex_modifications/rules.json ~/.config/karabiner/assets/complex_modifications/rules.json
ln -snf ~/.dotfiles/config/.config/opencode/AGENTS.md ~/.config/opencode/AGENTS.md
ln -snf ~/.dotfiles/config/.config/opencode/oh-my-opencode.json ~/.config/opencode/oh-my-opencode.json
ln -snf ~/.dotfiles/config/.config/opencode/opencode.json ~/.config/opencode/opencode.json
ln -snf ~/.dotfiles/config/Library/Application\ Support/com.mitchellh.ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
ln -snf ~/.dotfiles/config/.gitconfig ~/.gitconfig
ln -snf ~/.dotfiles/config/.zprofile ~/.zprofile
ln -snf ~/.dotfiles/config/.zshrc ~/.zshrc
