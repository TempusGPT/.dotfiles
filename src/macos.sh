# Dock
defaults write com.apple.dock "orientation" -string "left"
defaults write com.apple.dock "tilesize" -int "48"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "mineffect" -string "scale"
defaults write com.apple.dock "mru-spaces" -bool "false"

# Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

# Desktop
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "false"
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "false"

# Keyboard
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"
defaults write com.apple.HIToolbox AppleFnUsageType -int "0"
defaults write NSGlobalDomain AppleKeyboardUIMode -int "2"

# Apply
killall Dock
killall Finder
