# Create necessary directories
mkdir -p ~/.config/opencode

# Symlink configuration files
ln -snf ~/.dotfiles/config/.config/opencode/oh-my-opencode.json ~/.config/opencode/oh-my-opencode.json
ln -snf ~/.dotfiles/config/.config/opencode/opencode.json ~/.config/opencode/opencode.json
