#!/bin/bash

# This script will install symlinks to the config-files

# install_file function
# first argument is the target file
# second argument is the source file
install_file () {
	if [ -a $1 ]
	then
		echo "$1 exists!"
	else
		echo "$1 added!"
		ln -s $2 $1
	fi
}

echo "Bash config files: "
install_file $HOME/.bashrc $PWD/bash/bashrc
install_file $HOME/.bash_profile $PWD/bash/bash_profile
echo -e "\n"

echo "Vim config files: "
install_file $HOME/.vimrc $PWD/vim/vimrc
echo -e "\n"

echo "Misc. config files: "
echo "none"
echo -e "\n"
