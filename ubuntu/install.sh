#!/bin/bash -eu

msg() { printf "\033[1;32m :: %s\n\033[0m" "$1"; }

repo=$(git rev-parse --show-toplevel)

msg "Installing programs"
sudo apt update && sudo apt install -y \
    keychain pass unzip

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

# Install nvm and node
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash'

echo "Installing oh-my-posh"
mkdir -p ~/.local/bin
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O ~/.local/bin/oh-my-posh
chmod +x ~/.local/bin/oh-my-posh

echo "Installing a font with glpyhs"
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip -O /tmp/font.zip
unzip -o /tmp/font.zip -d ~/.local/share/fonts
fc-cache -fv
rm /tmp/font.zip

echo "Installing custom prompt theme"
mkdir -p ${HOME}/.prompt/
cp ${repo}/dotfiles/ubuntu/catppuccin_frappe.omp.json ${HOME}/.prompt/

msg "Reloading bashrc"
source "${HOME}/.bashrc"

echo ""
msg "--------"
msg "Remember to set the font for the terminal program!"
msg "--------"
echo ""

