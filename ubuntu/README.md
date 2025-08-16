# Ubuntu dotfiles

Run `./install.sh`.

The old dotfiles are backed up to `~/bkp-dotfiles` just in case. 

# Fonts

The Nerd Font `Caskaydia Cove` is used from https://github.com/ryanoasis/nerd-fonts.

To make the prompt display unicode characters on the terminal, the font needs to be updated in the terminal program.

Same for vscode - in settings add

```{json}
{
    ...
    "editor.fontLigatures": true,
    "editor.fontFamily": "'CaskaydiaCove NF'",
    ...
}
```
