#!/bin/bash -eu

# Run this script as root

sudo -u ${SUDO_USER} ./_install-ubuntu.sh
sudo -u ${SUDO_USER} cp home-vimrc /home/akhil/.vimrc

cp etc-inputrc /etc/inputrc

