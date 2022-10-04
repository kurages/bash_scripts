# bash_scripts
bashの起動スクリプト

```bash
while read -r f; do
  source $f
done < <(find ~/.bash_script/ -name "*.bashrc"| sort -r)
```
これを`.bashrc`に追記

