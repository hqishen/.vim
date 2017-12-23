# vim-config
## vim config repo

### 首先还是先保证安装如下软件，再进行其他配置操作 

    安装vim8
    
      sudo add-apt-repository ppa:jonathonf/vim
    
      sudo apt-get update
    
      sudo apt-get install vim
    
    安装ctags：sudo apt-get install ctags
    
    安装一些必备程序：sudo apt-get install xclip vim-gnome astyle


1】  ### 首先保证安装了git

2】  ### 然后， 安装git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

3】  在vim命令行里执行：BundleInstall

4】 在/home/sundae/.vim/bundle/nerdtree/autoload/nerdtree的路径下的文件344行修改把2， 3改成1



如果有卡顿的情况，请如下操作：
打开终端，执行下面的命令就自动安装好了：

wget -qO- https://raw.github.com/ma6174/vim/master/setup.sh | sh -x

或者自己手动安装：(以ubuntu为例)
安装vim sudo apt-get install vim
安装ctags：sudo apt-get install ctags
安装一些必备程序：sudo apt-get install xclip vim-gnome astyle python-setuptools
python代码格式化工具：sudo easy_install -ZU autopep8
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
clone配置文件：cd ~/ && git clone git://github.com/ma6174/vim.git
mv ~/vim ~/.vim
mv ~/.vim/.vimrc ~/
clone bundle 程序：git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
打开vim并执行bundle程序:BundleInstall
重新打开vim即可看到效果
了解更多vim使用的小技巧：
