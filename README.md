# vim-config
## vim config repo

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

