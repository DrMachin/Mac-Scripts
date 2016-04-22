#!/bin/bash

##----------------SECURITY---------------------

## SET SCREENSAVER TO PROMPT IMMEDIATELY FOR PASSWORD
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

##-----------------SYSTEM----------------------

## HIDE USER LIBRARY (JUST IN CASE WE CHANGED IT BEFORE)
chflags hidden ~/Library

## STOP TIME MACHINE PROMPT ON NEW EXTERNAL DRIVES
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

##--------------USER SETTINGS-----------------

## TURN OFF FAST USER SWITCHING
defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool false

##-----------------FINDER----------------------

## Set Documents as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://~/Documents/"

##  DON'T CREATE DS_STORE FILES ON NETWORK
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

##-----------------SAFARI----------------------

## DISABLE SAFARI AUTO OPEN FOR "SAFE" FILES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

##-----------------ACTIONS--------------------

## RUN ALL MACOS UPDATES
softwareupdate --install -all

## RESTART MACHINE TO APPLY SETTINGS
osascript -e 'display notification "Please save your work. Your computer will restart in 10 minutes" with title "System Restart"'
shutdown -r +10

##-----------------TODO---------------
#
#   - ENABLE LOCATION SERVICES