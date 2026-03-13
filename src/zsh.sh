# Suppress "Last login" message
touch ~/.hushlogin

# Symlink configuration files
ln -snf ~/.dotfiles/config/.config/starship.toml ~/.config/starship.toml
ln -snf ~/.dotfiles/config/.zprofile ~/.zprofile
ln -snf ~/.dotfiles/config/.zshrc ~/.zshrc
