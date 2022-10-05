# bash_scripts
拡張機能的な使い方ができるやつ  

デフォルトで入ってるやつはそのうちまとめます  
`_`から始まるファイルは無視されます。  

## how to use
### Dissolution of Dependency
`sudo apt install jq -y`  

### install
`bash install.sh`

### スクリプト使わない場合
`bash_script/`を`$HOME/.bash_script`に移動  

```bash
while read -r f; do
  source $f
done < <(find ~/.bash_script/ -name "*.bashrc"| sort -r)
```
これを`.bashrc`に追記  

ログインしなおすか`source ~/.bashrc`すればおk

## ロードスクリプトの追加
ファイル名を`優先順位_hoge.bashrc`にして`$HOME/.bash_script`直下に置けばおｋ  
優先順位は`高 01 -> 99 低`  
