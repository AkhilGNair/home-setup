#!/bin/bash -eu

msg() { printf "\033[1;32m :: %s\n\033[0m" "$1"; }

repo=$(git rev-parse --show-toplevel)

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

echo "Installing tmux"
msg "Installing tmux files"
# Install tmux plugin manager
cp ${repo}/dotfiles/ubuntu/.tmux.conf ${HOME}
~/.tmux/plugins/tpm/bin/install_plugins
~/.tmux/plugins/tpm/bin/update_plugins all

msg "Reloading bashrc"
source "${HOME}/.bashrc"

