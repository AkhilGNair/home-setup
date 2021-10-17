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

echo "Installing oh-my-posh"
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O ~/.local/bin/oh-my-posh
chmod +x ~/.local/bin/oh-my-posh

echo "Getting themes"
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip

echo "Installing a font with glpyhs"
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip -O /tmp/font.zip
unzip /tmp/font.zip -d ~/.local/share/fonts
fc-cache -fv
rm /tmp/font.zip

msg "Reloading bashrc"
source "${HOME}/.bashrc"

echo "Remember to set the font for the terminal program!"