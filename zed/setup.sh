# Create necessary directory
mkdir -p ~/.config/zed

# Symlink configuration files
ln -snf ~/.dotfiles/zed/keymap.json ~/.config/zed/keymap.json
ln -snf ~/.dotfiles/zed/settings.json ~/.config/zed/settings.json
