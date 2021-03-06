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

##--------------SOFTWARE UPDATES--------------

## RUN ALL MACOS UPDATES
softwareupdate --install -all

##--------------REQUIRES ROOT-----------------

##ENABLE LOCATION SERVICES
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.locationd.plist
uuid=`/usr/sbin/system_profiler SPHardwareDataType | grep "Hardware UUID" | cut -c22-57`
sudo defaults write /var/db/locationd/Library/Preferences/ByHost/com.apple.locationd.$uuid LocationServicesEnabled -int 1
sudo chown -R _locationd:_locationd /var/db/locationd
sudo launchctl load /System/Library/LaunchDaemons/com.apple.locationd.plist

## RESTART MACHINE TO APPLY SETTINGS
osascript -e 'display notification "Please save your work. Your computer will restart in 10 minutes" with title "System Restart"'
sudo shutdown -r +10

##-----------------TODO---------------
#
#  