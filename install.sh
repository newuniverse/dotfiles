#!/bin/sh
echo 'git clone dotfiles repository'
git clone https://github.com/newuniverse/dotfiles.git
cd dotfiles
rake all