#!/bin/bash

##  DON'T CREATE DS_STORE FILES ON NETWORK
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## SET SCREENSAVER TO PROMPT IMMEDIATELY FOR PASSWORD
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

## HIDE USER LIBRARY (JUST IN CASE WE CHANGED IT BEFORE)
chflags hidden ~/Library

## RUN ALL MACOS UPDATES
sudo softwareupdate --install -all