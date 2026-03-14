# Suppress "Last login" message
touch ~/.hushlogin

# Symlink configuration files
ln -snf ~/.dotfiles/zsh/.zprofile ~/.zprofile
ln -snf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -snf ~/.dotfiles/zsh/starship.toml ~/.config/starship.toml
