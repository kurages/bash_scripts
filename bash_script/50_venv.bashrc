
venv-gen() {
        python3 -m venv ~/.venv/$1
}

venv-list() {
        ls -1 ~/.venv/
}

venv() {
        source ~/.venv/$1/bin/activate
}

alias end="deactivate"
alias fin="deactivate"

