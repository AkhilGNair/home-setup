# Load a venv
function venv {
    [[ -z "$1" ]] && \
        source $HOME/virtualenvs/${PWD##*/}/bin/activate || \
        source $HOME/virtualenvs/$1/bin/activate
}

# Make a python virtual environment
function make_venv {
    venv_name=${PWD##*/}
    python3 -m venv $HOME/virtualenvs/${venv_name}
    echo ":: Created virtualenv '${venv_name}'"
    venv
    echo ":: Loaded virtualenv '${venv_name}'"
}

# Reload the bash profile
function reload { source ~/.bash_profile; }

# Quick and dirty, tabulate over a prefix regex
function unique_prefix {
    grep -Inro $1 | cut -d":" -f3 | sort -u
}

# Quick attempt to decode a jwt
function jwt {
    sed 's/\./\n/g' <<< $(cut -d. -f1,2 <<< $1) | base64 --decode | jq
}

 # Pretty print json file
 function pretty-json {
     python -c "import json;print(json.dumps(json.load(open(\"$1\", \"r\")), indent=2))"
 }

 function pathnl {
    echo $PATH | sed "s/:/\n/g"
 }

# Go to a random tmp dir
function tempdir {
    temp_dir=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13)
    mkdir -p /tmp/$temp_dir
    cd /tmp/$temp_dir
}

# Watch k8s resource type
kwatch () { watch kubectl get $1 -o wide ; }
kenter () { kubectl exec -it $1 ${2:-bash} ; }

# Custom autocompletion
_complete_venvs ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_venvs=$(ls $HOME/virtualenvs)
        COMPREPLY=( $(compgen -W "${comp_venvs}" -- $cur))
        return 0
}
complete -F _complete_venvs venv

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
