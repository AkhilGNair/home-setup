# Load a venv
function venv {
    [[ -z "$1" ]] && \
        source $HOME/virtualenvs/${PWD##*/}/bin/activate || \
        source $HOME/virtualenvs/$1/bin/activate
}

_complete_venvs ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_venvs=$(ls $HOME/virtualenvs)
        COMPREPLY=( $(compgen -W "${comp_venvs}" -- $cur))
        return 0
}
complete -F _complete_venvs venv

# Reload the bash profile
function reload { source ~/.bash_profile; }

# Autocomplete ssh hosts
# Only run on bash shell
if echo “$0” | grep -q 'bash'; then
    _complete_ssh_hosts ()
    {
            COMPREPLY=()
            cur="${COMP_WORDS[COMP_CWORD]}"
            comp_ssh_hosts=`cat ~/.ssh/*hosts | \
                            cut -f 1 -d ' ' | \
                            sed -e s/,.*//g | \
                            grep -v ^# | \
                            uniq | \
                            grep -v "\[" | \
                            grep -Ev "^[0-9]{2,3}\." ;
                    cat ~/.ssh/*config | \
                            grep "^Host " | \
                            awk '{print $2}'
                    `
            COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
            return 0
    }
    complete -F _complete_ssh_hosts ssh
fi

# Quick and dirty, tabulate over a prefix regex
function unique_prefix {
    grep -Inro $1 | cut -d":" -f3 | sort -u
}

# Go to a random tmp dir
function tempdir {
    temp_dir=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13)
    mkdir -p /tmp/$temp_dir
    cd /tmp/$temp_dir
}

# Watch k8s resource type
kwatch { watch kubectl get $1 -o wide ; }
kenter () { kubectl exec -it $1 ${2:-bash} ; }
