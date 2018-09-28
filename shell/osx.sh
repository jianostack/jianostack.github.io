# check timezone
sudo systemsetup -gettimezone

# hidden files
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

# turn off mouse acceleration
defaults write .GlobalPreferences com.apple.mouse.scaling -1