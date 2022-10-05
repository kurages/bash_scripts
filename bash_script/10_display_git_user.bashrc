function _get-git-user-file() {
	echo "${HOME}/.config/bash_scripts/git_multi_user.json"
}

if [ ! -f $(_get-git-user-file) ]; then
	mkdir -p ~/.config/bash_scripts/
	cat <<- EOF > $(_get-git-user-file)
	[
	    {
	        "username": "user_name",
	        "email": "sample@example.com"
	    },
	    {
		    "username": "user_name2",
			"alias": "user2",
	        "email": "sample2@example.com"
	    }
	]
	EOF
fi

function git-user-set(){ # (alias or username)
	SETTING_FILE=$(_get-git-user-file)
	function config-set() { # (username, email)
		# Setting up user and mail
		git config --local user.name $1 && \
		git config --local user.email $2 && \
		return 0
	}

	function get-user(){ # (username or alias)
		user=$(cat ${SETTING_FILE}| jq -r --exit-status ".[] | select(.username == \"$1\" or .alias == \"$1\")")
		if [ 0 -eq $? ]; then
			echo $user
			return 0
		else
			return 1
		fi
	}

	user=$(get-user $1) || return 1
	if [ 0 -eq $? ]; then
		username=$(echo $user| jq -r --exit-status ".username")
		email=$(echo $user| jq -r --exit-status ".email")
		config-set ${username} ${email}
		return 0
	else
		echo "Users that do not exist."
		return 1
	fi
}

function git-user-list() {
	cat $(_get-git-user-file)| jq -r ".[].username"
}

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

PS1="\[\e[0;32m\]\w \[\e[0;37m\]\$(git-user-get)\$ "
