#!/bin/bash

set -e

# This script will install symlinks to the config-files

# install_file function, basically a wrapper for ln with prints
# first argument is the target file
# second argument is the source file
install_file () {
	if [ -L $1 ]
	then
		echo "$1 already symlinked"		# not checking wether its symlinked correctly tho
	elif [ -e $1 ]
	then
		echo "$1 exists!"
	else
		echo "$1 added!"
		ln -s $2 $1
	fi
}

echo "Bash config files: "
install_file $HOME/.bashrc $PWD/bash/bashrc
install_file $HOME/.inputrc $PWD/bash/inputrc
echo

echo "Vim config files: "
mkdir -p $HOME/.vim/colors/
install_file $HOME/.vimrc $PWD/vim/vimrc
install_file $HOME/.vim/colors/mycolors.vim $PWD/vim/colors/mycolors.vim
echo

echo "i3 config files: "
mkdir -p $HOME/.i3
install_file $HOME/.i3/config $PWD/i3/config
install_file $HOME/.i3status.conf $PWD/i3/i3status.conf
echo

echo "Misc. config files: "
install_file $HOME/.profile $PWD/misc/profile
install_file $HOME/.xsessionrc $PWD/misc/xsessionrc
install_file $HOME/.Xresources $PWD/misc/Xresources
install_file $HOME/.Xdefaults $PWD/misc/Xresources
install_file $HOME/.xinitrc $PWD/misc/xinitrc
install_file $HOME/.screenrc $PWD/misc/screenrc
mkdir -p $HOME/.config/xfce4/terminal
install_file $HOME/.config/xfce4/terminal/terminalrc $PWD/config/xfce4/terminal/terminalrc
echo
