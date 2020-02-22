# # Fix terminal buffer issues in docker exec
# -e COLUMNS=$COLUMNS -e LINES=$LINES -e TERM=$TERM

# Source various dot files aliases if they exist
if [ -f ~/.bash_functions ]; then . ~/.bash_functions; fi
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

# Add git branch to PS1
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  GIT_PROMPT_ONLY_IN_REPO=1
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# PROMPT
PROMPT_COMMAND=__prompt_command
__prompt_command() {
	local errcode=$?
	local arrow=">\[\e[m\]"
	local nope="\e[0m\[\e[m\]"
	local git=""
	if [ $errcode != 0 ]; then
		arrow="\[\e[31m\]$arrow"
	else
		arrow="\[\e[32m\]$arrow"
	fi

	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWSTASHSTATE=true
	GIT_PS1_SHOWUNTRACKEDFILES=true
	GIT_PS1_SHOWUPSTREAM="auto"
	GIT_PS1_DESCRIBE_STYLE="branch"
	GIT_PS1_SHOWCOLORHINTS=true
        git=$(__git_ps1 "on \[\e[36m\]%s\[\e[m\]" 2> /dev/null)

	PS1=""
	type __prompt_command_local &> /dev/null && __prompt_command_local
	PS1="$nope\[\e[34m\]\u\[\e[m\] at \[\e[35m\]\h\[\e[m\] in \[\e[33m\]\w\[\e[m\] $git$PS1\n$arrow "
}

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

# Source git bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/share/google-cloud-sdk/completion.bash.inc ] && . /usr/share/google-cloud-sdk/completion.bash.inc

# Autojump
[ -f /usr/share/autojump/autojump.bash ] && . /usr/share/autojump/autojump.bash

# Tilix Error - https://gnunn1.github.io/tilix-web/manual/vteconfig/ 
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

