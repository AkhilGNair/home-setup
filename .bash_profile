# # Set keyboard repeat speed to fast
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# defaults write NSGlobalDomain KeyRepeat -int 2
# defaults write NSGlobalDomain InitialKeyRepeat -int 15

# # Fix terminal buffer issues in docker exec
# -e COLUMNS=$COLUMNS -e LINES=$LINES -e TERM=$TERM

# Environment variables
HISTFILESIZE=10000000
export PYTHONDONTWRITEBYTECODE=true
export BYOBU_PREFIX=/usr/local

# Command line default options
export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude-dir=.git'
# Add git branch to PS1
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  GIT_PROMPT_ONLY_IN_REPO=1
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# # Source extra bash completion
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
# . $(brew --prefix)/etc/bash_completion
# fi

# Source git bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Source various dot files aliases if they exist
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 
if [ -f ~/.bash_functions ]; then . ~/.bash_functions; fi 

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/akhilnair/Downloads/google-cloud-sdk/path.bash.inc' ]; 
    then . '/Users/akhilnair/Downloads/google-cloud-sdk/path.bash.inc'; 
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/akhilnair/Downloads/google-cloud-sdk/completion.bash.inc' ]; 
    then . '/Users/akhilnair/Downloads/google-cloud-sdk/completion.bash.inc'; 
fi

