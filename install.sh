#!/bin/bash

DPATH=$(cd `dirname $0` && pwd)

# link dotfiles
ln -sfn $DPATH/.bashrc ~/.bashrc
ln -sfn $DPATH/.bash_aliases ~/.bash_aliases
ln -sfn $DPATH/.clang-format ~/.clang-format
ln -sfn $DPATH/.clang-tidy ~/.clang-tidy

mkdir -p /home/$USER/.config/nvim
ln -fsn $DPATH/nvim/* /home/$USER/.config/nvim
sudo apt-get install git && ln -fs $DPATH/.gitconfig ~/.gitconfig

# install programs from file
sudo apt-get update
sudo apt-get upgrade -y
for program in `cat $DPATH/programs_list.txt`
do
	echo "\033[0;32mInstalling $program\033[0m"
	sudo apt-get install $program -y
done

# install nvim and plugins
sh $DPATH/install_nvim.sh

