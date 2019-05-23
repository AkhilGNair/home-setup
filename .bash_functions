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

# Remove python compiled files
pyclean () {
        find . -type f -name "*.py[co]" -delete
        find . -type d -name "__pycache__" -delete
        find . -type d -name ".pytest_cache" -delete
}

# kubectl functions
kgc () {
  kubectl config get-contexts
}

ksc () {
  kubectl config use-context $(kgc | grep $1 | awk '{print $2}')
}

# Invoke sh on a temp docker image - useful for broken builds
cacherun () {
  docker run --rm -it $1 sh
}

