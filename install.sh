#!/bin/sh
/usr/bin/ruby -e '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)'
brew install git
git clone https://github.com/newuniverse/dotfiles.git
cd dotfiles
source .zprofile
rake all
