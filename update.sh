#!/usr/bin/env bash
if [ ! -d ~/.bash_script ]; then
	echo You should execute \'bash install.sh\'.
	exit 1
fi

cd `dirname $0`
cp -rf bash_script/* ~/.bash_script

cd -
