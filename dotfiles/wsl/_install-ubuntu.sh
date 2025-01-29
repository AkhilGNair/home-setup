#!/bin/bash -eu

msg() { printf "\033[1;32m :: %s\n\033[0m" "$1"; }

repo=$(git rev-parse --show-toplevel)

msg "Installing programs"
sudo apt update && sudo apt install -y \
    keychain

# Install .bash* files, replace history
msg "Installing bash files"

# Backup all old bash files
mkdir -p "${HOME}/bkp-dotfiles"
mv ${HOME}/.bash* ${HOME}/bkp-dotfiles 2>/dev/null || true
# Install the new ones
cp ${repo}/dotfiles/ubuntu/.bash* ${HOME}
# Replace the important old files if they existed
cp ${HOME}/bkp-dotfiles/.bash_history ${HOME} || true
cp ${HOME}/bkp-dotfiles/.bash_profile.local ${HOME} || true

# Install .gitconfig
msg "Installing git files"
mv ${HOME}/.gitconfig ${HOME}/bkp-dotfiles 2>/dev/null || true
cp ${repo}/dotfiles/ubuntu/.gitconfig ${HOME}

# Faster reverse search
cp ${repo}/dotfiles/ubuntu/.inputrc ${HOME}

msg "Installing tmux files"
sudo apt install tmux -y

# tmux config
pushd $HOME
git clone https://github.com/gpakosz/.tmux.git || true
ln -s -f .tmux/.tmux.conf
cp ${repo}/dotfiles/ubuntu/.tmux.conf.local ${HOME}
popd

echo "Installing oh-my-posh"
mkdir -p ~/.local/bin
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O ~/.local/bin/oh-my-posh
chmod +x ~/.local/bin/oh-my-posh

echo "Getting themes"
mkdir -p ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip -o ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip

echo "Installing a font with glpyhs"
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip -O /tmp/font.zip
unzip -o /tmp/font.zip -d ~/.local/share/fonts
fc-cache -fv
rm /tmp/font.zip

echo "Installing custom prompt theme"
cp -r ${repo}/dotfiles/ubuntu/prompt ${HOME}

msg "Reloading bashrc"
source "${HOME}/.bashrc"

echo ""
msg "--------"
msg "Remember to set the font for the terminal program!"
msg "--------"
echo ""

