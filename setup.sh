#!/bin/bash

#TODO Check what platform we're on.

# Install Mosh
# http://mosh.mit.edu
sudo apt-get -y install python-software-properties
sudo add-apt-repository -y ppa:keithw/mosh
sudo apt-get update
sudo apt-get install -y mosh

# Install heroku
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Boiler plate from https://github.com/startup-class/setup/blob/master/setup.sh
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles .dotfiles.old
fi
git clone https://github.com/wgjohnson/dotfiles.git
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.vimrc .
cp dotfiles/.ssh_config .ssh/config && chmod 600 .ssh/config
