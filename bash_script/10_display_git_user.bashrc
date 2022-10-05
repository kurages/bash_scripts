if [ ! -f ~/.config/bash_scripts/git_multi_user.json ]; then
	mkdir -p ~/.config/bash_scripts/
	cat <<- EOF > ~/.config/bash_scripts/git_multi_user.json
	{
	    "user_name": {
	        "email": "sample@example.com"
	    }
	}
	EOF
fi

function git-user-set(){
	SETTING_FILE="${HOME}/.config/bash_scripts/git_multi_user.json"
	function config-set() { # username email
		# Setting up user and mail
		git config --local user.name $1 && \
		git config --local user.email $2 && \
		return 0
	}
	email=$(cat ${SETTING_FILE}| jq -r --exit-status .$1.email)
	if [ 0 -eq $? ]; then
		config-set $1 ${email}
	else
		echo "Users that do not exist."
		return 1
	fi
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
