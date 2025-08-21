#!/bin/bash -eu

echo "Installing nvim"

sudo apt remove neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y \
  gcc \
  neovim \
  fd-find \
  ripgrep \
  python3-venv

git clone git@github.com:AkhilGNair/nvim.git $HOME/.config/nvim

