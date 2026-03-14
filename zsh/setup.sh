ln -snf ~/.dotfiles/zsh/.zprofile ~/.zprofile
ln -snf ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -snf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -snf ~/.dotfiles/zsh/starship.toml ~/.config/starship.toml

# Suppress "Last login" message
touch ~/.hushlogin
