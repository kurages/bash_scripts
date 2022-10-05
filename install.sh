#!/usr/bin/env bash
cd `dirname $0`

export install_dir=~/.bash_script

mkdir $install_dir >/dev/null 2>&1
if [ $? -ne 0 ]; then
	rm -rf $install_dir/*
fi
cp -rf bash_script/* $install_dir

cat <<EOF >> ~/.bashrc

while read -r f; do
	source \$f
done < <(find "$install_dir/" -name "*.bashrc"| sort -r)

EOF


