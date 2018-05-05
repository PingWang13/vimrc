vimrc
=====

my vim configuration
### How to install

    git clone https://github.com/PingWang13/vimrc.git
    [//]将文件复制到~/目录下
    
    
    cp ~/vimrc/vimrc ~/.vimrc
    (将刚下载到的vimrc文件复制到~/目录下，并重命名为.vimrc)
    
    
    sudo git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    (下载vundle插件管理插件，到~/.vim/bundle/vundle目录下)
    

    mkdir -p ~/.vim/syntax
    (递归创建目录~/.vim/syntax)
    
    
    cp -rf ~/vimrc/syntax/* ~/.vim/syntax
    (强制递归复制~/vimrc/syntax/* 即文件夹内的所有内容到 ~/.vim/syntax 文件夹下)
    

open VIM, then run
(打开VIM软件，运行一下命令)


    :BundleInstall
