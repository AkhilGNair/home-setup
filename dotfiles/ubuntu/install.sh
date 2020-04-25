#!/bin/bash -eu

mkdir -p "${HOME}/bkp-dotfiles"

# Install .bash* files, replace history
mv ${HOME}/.bash* ${HOME}/bkp-dotfiles 2>/dev/null || true
cp ${HOME}/repos/home-setup/dotfiles/ubuntu/.bash* ${HOME}
mv ${HOME}/bkp-dotfiles/.bash_history ${HOME} || true

# Install .gitconfig
mv ${HOME}/.gitconfig ${HOME}/bkp-dotfiles 2>/dev/null || true
cp ${HOME}/repos/home-setup/dotfiles/ubuntu/.gitconfig ${HOME}

# Install kakrc
ln -s $(pwd)/kak/ $XDG_CONFIG_HOME/kak

source "${HOME}/.bashrc"

