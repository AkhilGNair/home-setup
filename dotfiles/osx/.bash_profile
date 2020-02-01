# # Set keyboard repeat speed to fast
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# defaults write NSGlobalDomain KeyRepeat -int 2
# defaults write NSGlobalDomain InitialKeyRepeat -int 15

# # Fix terminal buffer issues in docker exec
# -e COLUMNS=$COLUMNS -e LINES=$LINES -e TERM=$TERM

# Source various dot files aliases if they exist
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 
if [ -f ~/.bash_functions ]; then . ~/.bash_functions; fi 

# Environment variables
export PYTHONDONTWRITEBYTECODE=true

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
# At each prompt, append to history
# PROMPT_COMMAND="$PROMPT_COMMAND; history -a"

# Command line default options
export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude-dir=.git'
# Add git branch to PS1
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  GIT_PROMPT_ONLY_IN_REPO=1
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# Source extra bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Source git bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

