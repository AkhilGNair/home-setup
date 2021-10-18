# Add default ssh key to keychain
eval $(keychain --eval id_rsa)

# # Fix terminal buffer issues in docker exec
# -e COLUMNS=$COLUMNS -e LINES=$LINES -e TERM=$TERM

# Source various dot files aliases if they exist
if [ -f ~/.bash_functions ]; then . ~/.bash_functions; fi
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

# Source any local machine config
if [ -f "$HOME/.bash_profile.local" ]; then
    source "$HOME/.bash_profile.local"
fi

# Environment variables
export PYTHONDONTWRITEBYTECODE=true

# Tilix Error - https://gnunn1.github.io/tilix-web/manual/vteconfig/
# May need to run
#
#    sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
#
# To create the initial symlink file
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

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
[ -f /usr/share/google-cloud-sdk/completion.bash.inc ] && . /usr/share/google-cloud-sdk/completion.bash.inc

# Autojump
[ -f /usr/share/autojump/autojump.bash ] && . /usr/share/autojump/autojump.bash

# oh-my-posh shell
eval "$(oh-my-posh --init --shell bash --config ~/prompt/akhil.omp.json)"

# At each prompt, append to history
# Should go with the history section, but seems to work best after omp and j
PROMPT_COMMAND="$PROMPT_COMMAND; history -a"


