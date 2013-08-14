#!/bin/bash

# This script will install symlinks to the config-files

# install_file function, basically a wrapper for ln with prints
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

echo "i3 config files: "
if [ ! -d $HOME/.i3 ]
then
	echo "Created $HOME/.i3/ directory"
	mkdir $HOME/.i3
fi
install_file $HOME/.i3/config $PWD/i3/config
install_file $HOME/.i3status.conf $PWD/i3/i3status.conf
echo -e "\n"

echo "Misc. config files: "
install_file $HOME/.Xresources $PWD/misc/Xresources
install_file $HOME/.Xdefaults $PWD/misc/Xresources
install_file $HOME/.Xmodmap $PWD/misc/Xmodmap
install_file $HOME/.xinitrc $PWD/misc/xinitrc
install_file $HOME/.asoundrc $PWD/misc/asoundrc
echo -e "\n"
