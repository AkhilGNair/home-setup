# Ubuntu dotfiles

Install dotfiles

```
mkdir -p ${HOME}/bkp-dotfiles

# Install .bash* files, replace history
mv ${HOME}/.bash* ${HOME}/bkp-dotfiles
cp ${HOME}/repos/home-setup/dotfiles/ubuntu/.bash* ${HOME}
mv ${HOME}/bkp-dotfiles/.bash_history ${HOME}

# Install .gitconfig
mv ${HOME}/.gitconfig ${HOME}/bkp-dotfiles 2>/dev/null || true
cp ${HOME}/repos/home-setup/dotfiles/ubuntu/.gitconfig ${HOME}

reload
```