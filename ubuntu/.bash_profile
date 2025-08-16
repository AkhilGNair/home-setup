# Add default ssh key to keychain
eval $(keychain --eval id_rsa)

# Source various dot files aliases if they exist
if [ -f ~/.bash_functions ]; then . ~/.bash_functions; fi

# Source any local machine config
if [ -f "$HOME/.bash_profile.local" ]; then
    source "$HOME/.bash_profile.local"
fi

# Environment variables
export PYTHONDONTWRITEBYTECODE=true
export PATH="$HOME/.local/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# HISTORY
# Eternal history
export HISTSIZE=
export HISTFILESIZE=
# Don't record some commands
export HISTIGNORE="ls:bg:fg:history"
# Use standard ISO 8601 timestamp
export HISTTIMEFORMAT="%F %T "
# Avoid duplicate entries
export HISTCONTROL="ignoreboth"
# Save multi-line commands as one command
shopt -s cmdhist
# Append to the history file when exiting
shopt -s histappend

# Source git bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# oh-my-posh shell
eval "$(oh-my-posh --init --shell bash --config ${HOME}/.prompt/catppuccin_frappe.omp.json)"

# At each prompt, append to history
# Should go with the history section, but seems to work best after omp and j
if [ -z "$PROMPT_COMMAND" ];
then
    PROMPT_COMMAND="history -a"
else
    PROMPT_COMMAND="$PROMPT_COMMAND history -a"
fi

