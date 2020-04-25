#!/bin/bash -eu

repo=$(git rev-parse --show-toplevel)

mkdir -p "${HOME}/bkp-dotfiles"

# Install .bash* files, replace history
mv ${HOME}/.bash* ${HOME}/bkp-dotfiles 2>/dev/null || true
cp ${repo}/dotfiles/ubuntu/.bash* ${HOME}
mv ${HOME}/bkp-dotfiles/.bash_history ${HOME} || true

# Install .gitconfig
mv ${HOME}/.gitconfig ${HOME}/bkp-dotfiles 2>/dev/null || true
cp ${repo}/dotfiles/ubuntu/.gitconfig ${HOME}

# Install kakrc
ln -s ${repo}/ubuntu/kak/ ~/.config/kak 2>/dev/null || true

echo "Installing tmux"
# Install tmux plugin manager
TMUX_HOME="${HOME}/.tmux/"
# git clone https://github.com/tmux-plugins/tpm ${TMUX_HOME}/plugins/tpm
cp ${repo}/dotfiles/ubuntu/.tmux.conf ${HOME}
${TMUX_HOME}/plugins/tpm/bin/install_plugins
${TMUX_HOME}/plugins/tpm/bin/update_plugins all

source "${HOME}/.bashrc"

