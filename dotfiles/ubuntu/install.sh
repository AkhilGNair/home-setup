#!/bin/bash -eux

msg() { printf "\033[1;32m :: %s\n\033[0m" "$1"; }

repo=$(git rev-parse --show-toplevel)

msg "Installing programs"
sudo apt update && sudo apt install -y \
    keychain

# Install .bash* files, replace history
msg "Installing bash files"
mkdir -p "${HOME}/bkp-dotfiles"
mv ${HOME}/.bash* ${HOME}/bkp-dotfiles 2>/dev/null || true
cp ${repo}/dotfiles/ubuntu/.bash* ${HOME}
mv ${HOME}/bkp-dotfiles/.bash_history ${HOME} || true

# Install .gitconfig
msg "Installing git files"
mv ${HOME}/.gitconfig ${HOME}/bkp-dotfiles 2>/dev/null || true
cp ${repo}/dotfiles/ubuntu/.gitconfig ${HOME}

cp ${repo}/dotfiles/ubuntu/.inputrc ${HOME}

# Install tmux
msg "Installing tmux files"
sudo apt install tmux -y

pushd $HOME
git clone https://github.com/gpakosz/.tmux.git || true
ln -s -f .tmux/.tmux.conf
cp ${repo}/dotfiles/ubuntu/.tmux.conf.local ${HOME}
popd

msg "Reloading bashrc"
source "${HOME}/.bashrc"

