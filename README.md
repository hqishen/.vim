# vim-config
## vim config repo

### 首先还是先保证安装如下软件，再进行其他配置操作 

    安装vim sudo apt-get install vim
    安装ctags：sudo apt-get install ctags
    安装一些必备程序：sudo apt-get install xclip vim-gnome astyle python-setuptools
    python代码格式化工具：sudo easy_install -ZU autopep8
    sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
    wget -qO- https://raw.github.com/ma6174/vim/master/setup.sh | sh -x


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
          
          'tagbar '用于显示类的各种信息
          
          'vim-easymotion' "快速跳转插件"
          
          'vim-trailing-whitespace' "标红最后一个空格"
          
          'matchit' "括号快速匹配和跳转 快捷键：%"
          
          'nerdcommenter' "快速加减注释 "
          
            ""<leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //，如果选中
            
            ""一行的部分内容则在选中部分前后添加分别 /、/；
            
            ""<leader>cu，取消选中文本块的注释。
            
          'tabular' "自动对齐功能"

## ctrlp 插件
### 它可以在当前文件夹下面搜索自己想要的东西，打开方式是“ctrl + p”



## 统计快捷键

    F1
    F2
    F3 打开和关闭nerdTree 文件树
    F4
    F5 用于编译
    F6 用于调试程序
    F7
    F8
    F9 用于打开或者是关闭taglist

    在打开了文件后可以在normal模式下\tb可以打开tagbar
    ctrl + p 可以搜索文件






## 更多配置详情
    http://www.cnblogs.com/zhongcq/p/3642794.html#toc_1.2
