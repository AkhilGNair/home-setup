alias venvh='source venv/bin/activate'

alias R='r --no-save --silent'
alias cat-pub-key='cat $HOME/.ssh/id_rsa.pub'
alias vim-ssh-config="vim $HOME/.ssh/$1-config"

# Mac copy and paste
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# ls variants
alias ls='ls -G'
alias ll='ls -lh'
alias lss='ls -lha'
alias lls='ls -lha'

alias grep='grep --color=auto --exclude=*.pyc --exclude-dir=.git'

alias duh='du -d1 -h | sort -h'
alias cta='cat'

# git stuff
alias gs='git status'
alias gd='git diff'
alias gpm='git pull origin master'

# kubectl stuff
alias k='kubectl'
alias kga='kubectl get all'
alias kgp='kubectl get pods -o wide'
alias kgd='kubectl get deployments'
alias kgl="kubectl logs $1"
alias kgs='kubectl get secrets'
alias kgso='kubectl get secrets -o yaml'
alias kgi='kubectl get ingress'
alias kgio='kubectl get ingress -o yaml'

alias kdp='kubectl describe pod $1'
alias kdd='kubectl describe deployment $1'