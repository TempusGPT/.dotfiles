# Create necessary directories
mkdir -p ~/.config/karabiner/assets/complex_modifications
mkdir -p ~/.cursor

# Symlink configuration files
ln -snf ~/.dotfiles/config/.config/karabiner/assets/complex_modifications/rules.json ~/.config/karabiner/assets/complex_modifications/rules.json
ln -snf ~/.dotfiles/config/.cursor/commands ~/.cursor/commands
ln -snf ~/.dotfiles/config/.cursor/mcp.json ~/.cursor/mcp.json
ln -snf ~/.dotfiles/config/.gitconfig ~/.gitconfig
ln -snf ~/.dotfiles/config/.zprofile ~/.zprofile
ln -snf ~/.dotfiles/config/.zshrc ~/.zshrc
