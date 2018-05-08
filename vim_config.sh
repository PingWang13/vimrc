#! /bin/bash
sudo apt-get install ctags
sudo cp -rf ~/vpackage/vimrc  ~/.vimrc
sudo mkdir -p ~/.vim/colors
sudo cp -rf ~/package/molokai.vim    ~/.vim/colors/
sudo git clone https://github.com/gmarik/vundle.git  ~/.vim/bundle/vundle
sudo vim +BundleList +BundleInstall +qall
