# Create necessary directories
mkdir -p ~/.config/karabiner/assets/complex_modifications
mkdir -p ~/.cursor
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
mkdir -p ~/Library/Application\ Support/Cursor/User

# Symlink configuration files
ln -snf ~/.dotfiles/config/.config/karabiner/assets/complex_modifications/rules.json ~/.config/karabiner/assets/complex_modifications/rules.json
ln -snf ~/.dotfiles/config/.cursor/commands ~/.cursor/commands
ln -snf ~/.dotfiles/config/.cursor/mcp.json ~/.cursor/mcp.json
ln -snf ~/.dotfiles/config/Library/Application\ Support/com.mitchellh.ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
ln -snf ~/.dotfiles/config/Library/Application\ Support/Cursor/User/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
ln -snf ~/.dotfiles/config/Library/Application\ Support/Cursor/User/keybindings.json ~/Library/Application\ Support/Cursor/User/keybindings.json
ln -snf ~/.dotfiles/config/.gitconfig ~/.gitconfig
ln -snf ~/.dotfiles/config/.zprofile ~/.zprofile
ln -snf ~/.dotfiles/config/.zshrc ~/.zshrc
