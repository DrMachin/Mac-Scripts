#!/bin/bash

##  DON'T CREATE DS_STORE FILES ON NETWORK
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## SET SCREENSAVER TO PROMPT IMMEDIATELY FOR PASSWORD
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

## Set Documents as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://~/Documents/"

## TURN OFF FAST USER SWITCHING
defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool false

## HIDE USER LIBRARY (JUST IN CASE WE CHANGED IT BEFORE)
chflags hidden ~/Library

## RUN ALL MACOS UPDATES
softwareupdate --install -all