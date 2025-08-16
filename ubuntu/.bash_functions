# Load a venv
function venv {
    [[ -z "$1" ]] && \
        source $HOME/virtualenvs/${PWD##*/}/bin/activate || \
        source $HOME/virtualenvs/$1/bin/activate
}

# Reload the bash profile
function reload { source ~/.bash_profile; }

# Go to a random tmp dir
function tempdir {
    temp_dir=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13)
    mkdir -p /tmp/$temp_dir
    cd /tmp/$temp_dir
}

function repo { cd ${HOME}/repos/$1 ; }
_complete_repos ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_repos=$(ls $HOME/repos)
        COMPREPLY=( $(compgen -W "${comp_repos}" -- $cur))
        return 0
}
complete -F _complete_repos repo
