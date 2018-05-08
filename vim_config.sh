#! /bin/bash
sudo apt-get install ctags
sudo cp -rf ~/vimrc/vimrc  ~/.vimrc
sudo cp -rf ~/vimrc/molokai.vim    ~/.vim/colors/
sudo git clone https://github.com/gmarik/vundle.git  ~/.vim/bundle/vundle
sudo vim +BundleList +BundleInstall +qall
