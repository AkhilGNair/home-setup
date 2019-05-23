alias venvh='source venv/bin/activate'

alias R='r --no-save --silent'
alias cat-pub-key='cat $HOME/.ssh/id_rsa.pub'
alias vim-ssh-config="vim $HOME/.ssh/$1-config"
alias dog='pygmentize -g $1'
alias cta='cat'
alias mkfeedback='cp /Users/akhilnair/candidates/TEMPLATE_FEEDBACK.md feedback.md'

# ls variants
alias ll='ls -lh'
alias lla='ls -lha'

alias duh='du -d1 -h | sort -h'
alias find='gfind'

# Docker suff
alias drun='docker run --rm -it $(basename `pwd`:$(cat Version)) bash'
alias dbuild='docker build --rm -f "Dockerfile" -t $(basename `pwd`):$(cat Version) .'

# git stuff
alias gs='git status'
alias gd='git diff'
alias gpm='git pull origin master'G

# kubectl stuff
alias kc='kubectl'
alias kgp='kc get pods -o wide'
alias kgd='kc get deployments'
alias kgl="kc logs $1"
