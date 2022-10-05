function git-user-get() {
        git config --local user.name > /dev/null 2>&1
        case $? in
                0 ) # Already set to local
                        echo "[$(git config user.name)]" ;;
                1 )
                        if [ -n "$(git config user.name)" ]; then
                                #Already set to local or higher
                                echo "[$(git config user.name)]"
                        else
                                #Not set
                                return 1
                        fi ;;
                128 ) # The repository could not be found.
                        return 128 ;;
        esac
}


function git-set() {
        function config-set() {
                # Setting up user and mail
                git config --local user.name $1 && \
                git config --local user.email $2 && \
                return 0
        }

        if [ ! -d ".git" ]; then
                # If you don't have a .git directory
                git init || return 2
        fi

        if [ "$1" = "user_name-0" ]; then
                config-set "user_name-0" "email-0" && return 0
        elif [ "$1" = "user_name-1" ]; then
                config-set "user_name-1" "email-1" && return 0
        else
                echo "Unauthorized users"&& \
                return 3
        fi
}

PS1="\[\e[0;32m\]\w \[\e[0;37m\]\$(git-user-get)\$ "
