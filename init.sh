#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    echo "$f"
done

# ln -s ~/.ghq/github.com/newuniverse/dotfiles/.gitconfig ~/.gitconfig;
# ln -s ~/.ghq/github.com/newuniverse/dotfiles/.zlogin ~/.zlogin;
# ln -s ~/.ghq/github.com/newuniverse/dotfiles/.zlogout ~/.zlogout;
# ln -s ~/.ghq/github.com/newuniverse/dotfiles/.zpreztorc ~/.zpreztorc;
# ln -s ~/.ghq/github.com/newuniverse/dotfiles/.zprofile ~/.zprofile;
# ln -s ~/.ghq/github.com/newuniverse/dotfiles/.zshenv ~/.zshenv;
# ln -s ~/.ghq/github.com/newuniverse/dotfiles/.zshrc ~/.zshrc;
