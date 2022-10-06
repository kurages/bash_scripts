# git-user
作業ディレクトリがリポジトリ内の場合、ターミナルプロントにリポジトリに設定されてるユーザー名を表示します。  

## ユーザー情報の設定
`~/.config/bash_scripts/git_multi_user.json`
```json
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
```

### username
`git config user.name`に設定する内容です。  

### email
`git config user.email`に設定する内容です。  

### alias
`git-user-set`でユーザー名の代わりに使用できます。  
入力は任意です。

# git-user-set
```bash
git-user-set user_name
```
`git config user.name`と`git config user.email`を設定します。  
`user_name`にはエイリアスも指定することができます。  

# git-user-list
設定済みのユーザー名を出力します。  

