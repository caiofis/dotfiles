#!/bin/bash

DPATH="/home/$USER/.dotfiles"

# link dotfiles
mkdir -p /home/$USER/.config/nvim
ln -fs $DPATH/nvim/* /home/$USER/.config/nvim
sudo apt-get install git && ln -fs $DPATH/.gitconfig ~/.gitconfig

# install programs from file
sudo apt-get update
sudo apt-get upgrade -y
for program in `cat $DPATH/programs_list.txt`
do
	echo "\033[0;32mInstalling $program\033[0m"
	sudo apt-get install $program -y
done

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install nvim and plugins
sh $DPATH/install_nvim.sh

