#! /bin/bash
#sudo apt-get install git
#sudo git clone https://github.com/PingWang13/vimrc.git   ~/package
sudo apt-get update
sudo apt-get install ctags
sudo apt-get update
sudo apt-get install vim
sudo cp -rf ~/package/vimrc  ~/.vimrc
sudo mkdir -p ~/.vim/colors
sudo cp -rf ~/package/molokai.vim    ~/.vim/colors/
sudo git clone https://github.com/gmarik/vundle.git  ~/.vim/bundle/vundle
sudo vim +BundleList +BundleInstall +qall

