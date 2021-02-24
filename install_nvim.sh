#!/bin/bash

sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim


# install a plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install nodejs for coc.nvim
if [ ! -x "$(command -v node)"]; then sudo apt-get install nodejs; fi

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes n | ~/.fzf/install

# install NERDFonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# install plugins
nvim +PlugInstall +qall
