alias venvh='source venv/bin/activate'

alias R='r --no-save --silent'
alias cat-pub-key='cat $HOME/.ssh/id_rsa.pub'
alias vim-ssh-config="vim $HOME/.ssh/$1-config"

alias cta='cat'

# ls variants
alias ll='ls -lh'
alias lla='ls -lha'

alias duh='du -d1 -h | sort -h'
alias find='gfind'

# git stuff
alias gs='git status'
alias gd='git diff'
alias gpm='git pull origin master'

# kubectl stuff
alias kc='kubectl'
alias kgp='kc get pods -o wide'
alias kgd='kc get deployments'
alias kgl="kc logs $1"
