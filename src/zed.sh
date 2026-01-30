# Create necessary directories
mkdir -p ~/.config/zed

# Symlink configuration files
ln -snf ~/.dotfiles/config/.config/zed/keymap.json ~/.config/zed/keymap.json
ln -snf ~/.dotfiles/config/.config/zed/settings.json ~/.config/zed/settings.json
