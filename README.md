# bash_scripts
bashの起動スクリプト  

## how to use
`bash_script/`を`$HOME/.bash_script`に移動  

```bash
while read -r f; do
  source $f
done < <(find ~/.bash_script/ -name "*.bashrc"| sort -r)
```
これを`.bashrc`に追記  
ログインしなおすか`source ~/.bashrc`すればおk

