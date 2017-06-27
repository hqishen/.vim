# vim-config
## vim config repo

### 首先还是先保证安装如下软件，再进行其他配置操作 

    安装vim sudo apt-get install vim
    安装ctags：sudo apt-get install ctags
    安装一些必备程序：sudo apt-get install xclip vim-gnome astyle python-setuptools
    python代码格式化工具：sudo easy_install -ZU autopep8
    sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
    clone配置文件：cd ~/ && git clone git://github.com/ma6174/vim.git


1】 ### 首先保证安装了git

2】  ### 然后， 安装Bundle：git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

3】 然后配置.vimrc 
        setrtp+=~/.vim/bundle/vundle/  
        "如果在windows下使用，设置为  
        "set rtp+=$HOME/.vim/bundle/vundle/  
        callvundle#rc()  
        "let Vundle manage Vundle  
        Bundle'gmarik/vundle' " required!  
        "Bundles托管插件示例  
4】  最后插件的安装：
    1、打开Vim→使用:BundleSearch插件名搜索自己需要的插件
    2、光标选定对应的候选插件，按下“i”安装该插件
    3、在.vimrc文件中添加Bundle对该插件的管理语句”Bundle'XXX' ”，XXX为插件在候选插件列表中的名字
    4、可以使用bundle提供的命令对安装的插件集进行管理

## installation plugin name：
          'Auto-Pairs'
          'python-imports.vim'
          'CaptureClipboard'
          'cpp.vim'
          'EditPlus'
          'indentpython.vim'
          'python_fold_compact'
          'python-imports.vim'
          'Python-Syntax'
          'Python-Syntax-Folding'
          'synmark.vim'
          'vim-cpp-auto-include'
          'vim-ipython'
          'youdao.dict'
          'ctrlp.vim'
