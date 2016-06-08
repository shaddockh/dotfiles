#!/bin/bash
# Modified from: https://gist.github.com/somebox/6b00f47451956c1af6b4
# A script to set up a new mac. Uses bash, homebrew, etc.

# Focused for Includes many utilities and apps:
# - homebrew,  node
# - quicklook plugins, terminal fonts
# - browsers: chrome, firefox
# - dev: iterm2, postgres, chrome devtools, etc.
# - team: dropbox, google drive, etc
# - utils: unarchiver, caffine, skitch, etc
# - productivity: evernote, viscosity, omnigraffle, karabiner, etc.


# Settings
#node_version="0.12.2"
#ruby_versions="1.9 2.1 2.2"
#ruby_default="2.1"

# helpers
function echo_ok { echo -e '\033[1;32m'"$1"'\033[0m'; }
function echo_warn { echo -e '\033[1;33m'"$1"'\033[0m'; }
function echo_error  { echo -e '\033[1;31mERROR: '"$1"'\033[0m'; }

echo_ok "Install starting. You may be asked for your password (for sudo)."

# requires xcode and tools!
xcode-select -p || exit "XCode must be installed! (use the app store)"

# requirements
cd ~
mkdir -p tmp
echo_warn "setting permissions..."
for dir in "/usr/local /usr/local/bin /usr/local/include /usr/local/lib /usr/local/share"; do
	sudo chgrp admin $dir
	sudo chmod g+w $dir
done

# homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
if hash brew &> /dev/null; then
	echo_ok "Homebrew already installed"
else
    echo_warn "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# RVM
#if hash rvm &> /dev/null; then
#	echo_ok "RVM already installed"
#else
#	echo "Installing RVM..."
#	curl -sSL https://get.rvm.io | bash -s stable --ruby
#fi
#
## add default gems to rvm
#global_gems_config="$HOME/.rvm/gemsets/global.gems"
#default_gems="bundler awesome-print lunchy rak"
#for gem in $default_gems; do
#	echo $gem >> $global_gems_config
#done
#awk '!a[$0]++' $global_gems_config > /tmp/global.tmp
#mv /tmp/global.tmp $global_gems_config
#
## RVM ruby versions
#for version in $ruby_versions; do
#	rvm install $version
#done

# moar homebrew...
brew update && brew cleanup

# brew taps
brew tap caskroom/versions
brew tap caskroom/fonts
brew tap homebrew/games

# Homebrew base
brew install \
  autoconf automake bash-completion cowsay cmatrix \
  ffmpeg figlet gettext go gpg freetype htop-osx jq libxml2 mongodb node \
  phantomjs postgres qt readline sqlite unrar v8 wget youtube-dl \
  tmux macvim git

brew install ffmpeg --with-libvpx

# brew cask fonts
echo_warn "Installing fonts..."
brew cask install \
  font-anonymous-pro \
  font-dejavu-sans-mono-for-powerline \
  font-droid-sans \
  font-droid-sans-mono font-droid-sans-mono-for-powerline \
  font-meslo-lg font-input \
  font-inconsolata font-inconsolata-for-powerline \
  font-liberation-mono font-liberation-mono-for-powerline \
  font-liberation-sans \
  font-meslo-lg \
  font-nixie-one \
  font-office-code-pro \
  font-pt-mono \
  font-roboto \
  font-source-code-pro font-source-code-pro-for-powerline \
  font-source-sans-pro \
  font-ubuntu font-ubuntu-mono-powerline


# brew cask quicklook
echo_warn "Installing QuickLook Plugins..."
brew cask install \
	qlcolorcode qlmarkdown qlprettypatch qlstephen \
	qlimagesize \
	quicklook-csv quicklook-json epubquicklook \
	animated-gif-quicklook

# Apps
echo_warn "Installing applications..."

# google
brew cask install google-chrome google-hangouts google-drive --force
# other favorites
# brew cask install bettertouchtool
brew cask install caffeine
# brew cask install karabiner
brew cask install the-unarchiver
brew cask install flux
brew cask install 1password
brew cask install dropbox
brew cask install evernote
brew cask install skitch
brew cask install iterm2
brew cask install mongohub
brew cask install chrome-devtools
brew cask install firefox
brew cask install atom
brew cask install filezilla
brew cask install picturelife
brew cask install alfred
brew cask install sourcetree
brew cask install audacity
brew cask install disk-inventory-x
   #day-o
  #minecraft spotify transmission vlc \
  #slack skype telephone \
  #citrix-receiver omnigraffle viscosity
  #adafruit-arduino iterm2 mongohub chrome-devtools firefox sublime-text3 \

# xquartz
echo_warn "Installing xquartz (this big download can be slow)"
n=0
until [ $n -ge 20 ]; do
	brew cask install xquartz && break
	n=$[$n+1]
	echo_error "... install failed, retry $n"
done
# brew imagemagick
brew cask install inkscape
brew install librsvg
brew install imagemagick --with-librsvg



# Set up some OSX defaults

# borrowed from https://github.com/alexandrecormier/dotfiles/tree/master/init
# Screenshot settings
defaults write com.apple.screencapture type png
defaults write com.apple.screencapture location ~/Pictures/Screenshots

echo
echo_ok "Done."
echo
echo "After Dropbox has finished installing, link Sublime Text settings:"
echo_warn "  cd ~/Library/Application\ Support/Sublime\ Text\ 3/"
echo_warn "  rm -rf Packages"
echo_warn "  ln -s ~/Dropbox/Sublime/Packages ."
echo
echo "Then go to https://packagecontrol.io/installation for Package Control"
echo
echo "You may want to add the following settings to your .bashrc:"
echo_warn '  export HOMEBREW_CASK_OPTS="--appdir=/Applications"'
echo
