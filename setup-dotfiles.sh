#!/bin/env sh

OS="`uname`"
case $OS in
  'Linux')
    echo "Linux"
    # For now only supporting debian based distros
    sudo apt-get install zsh
    chsh -s $(which zsh)
    sudo apt-get install software-properties-common python-software-properties
    sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
    sudo apt-get update
    sudo apt-get install rcm
    sudo apt-get install tmux
    sudo apt-get install ag
    ;;
  'Darwin') 
    OS='Mac'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    chsh -s $(which zsh)
    brew tap thoughtbot/formulae
    brew install rcm
    ;;
esac

rcup

