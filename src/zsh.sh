# Suppress "Last login" message
touch ~/.hushlogin

# Symlink configuration files
ln -snf ~/.dotfiles/config/.zprofile ~/.zprofile
ln -snf ~/.dotfiles/config/.zshrc ~/.zshrc

# Generate Starship configuration
starship preset nerd-font-symbols -o ~/.config/starship.toml
