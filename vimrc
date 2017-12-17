"/*******************************************************

"/--------->:brif:   VIM 的配置字段------------

"/--------->:Author: sundae--------------------

"/--------->:Version: v0.01 17-11-04 building

"/--------->:Version: v0.02 17-11-05 add some plugin

"********************************************************

set sw=4
set ts=4
set et
set smarttab
set smartindent
set lbr
set fo+=mB
set sm
set selection=inclusive
set wildmenu
set mousemodel=popup
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set cul "高亮光标所在行
set cuc
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示
set go=             " 不要图形按钮

set guifont=Courier_New:h10:cANSI   " 设置字体
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行
autocmd InsertEnter * se cul    " 用浅色高亮当前行
set ruler           " 显示标尺
set showcmd         " 输入的命令显示出来，看的清楚些
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
set foldenable      " 允许折叠
set foldmethod=manual   " 手动折叠
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限

" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 使用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目

"将tab替换为空格
nmap tt :%s/\t/    /g<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if expand("%:e") == 'sh'
        call setline(1,"\#!/bin/bash")
    elseif expand("%:e") == 'py'
        call setline(1,"#!/usr/bin/env python")
    elseif expand("%:e") == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
        "    elseif &filetype == 'mkd'
        "        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else
        call append(line("."), "	> File Name  : ".expand("%"))
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+7, "#include <iostream>")
        call append(line(".")+8, "using namespace std;")
        call append(line(".")+9, "")
    endif
    if &filetype == 'c'
        call append(line(".")+7, "#include <stdio.h>")
        call append(line(".")+8, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+7, "#pragma once")
        "        call append(line(".")+8, "#define _".toupper(expand("%:r"))."_H")
        "        call append(line(".")+9, "#endif")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nmap <silent> <F9> <ESC>:Tlist<RETURN>
" shift tab pages
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
map! <C-Z> <Esc>zzi
map! <C-O> <C-Y>,
map <C-A> ggVG$"+y
map <F12> gg
map <C-w> <C-w>w
imap <C-k> <C-y>,
imap <C-t> <C-q><TAB>
imap <C-j> <ESC>
" 选中状态下 Ctrl+c 复制
"map <C-v> "*pa
set mouse=v
imap <C-v> <Esc>"*pa
imap <C-a> <Esc>^
imap <C-e> <Esc>$
vmap <C-c> "+y

"
"map <F3> :NERDTreeToggle<CR>
"imap <F3> <ESC> :NERDTreeToggle<CR>
"打开树状文件目录
"map <C-F3> \be

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< -std=c++11"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        "        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

"
"autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全
set completeopt=preview,menu
"允许插件
set clipboard+=unnamed

"自动保存
set autowrite
"set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" 在处理未保存或只读文件的时候，弹出确认
set confirm
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
set linespace=0
" 增强模式中的命令行自动完成操作
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
filetype plugin indent on
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu


"<----------------- Plugin Manager --------------->
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"Bundle 'gmarik/vundle'

Bundle 'Auto-Pairs'

Bundle 'ctrlp.vim'

"Tabular: 自动对齐。
Bundle 'godlygeek/tabular'

Bundle 'CaptureClipboard'

"按tab健9选择补全"
Bundle 'SuperTab'

"Plugin 'NERD_Tree'
Bundle 'https://github.com/scrooloose/nerdtree'

"Plugin tagbar"
Bundle 'https://github.com/majutsushi/tagbar'

"按tab健9选择补全"
"Plugin 'SuperTab'
"标记无用空格
Bundle 'bronson/vim-trailing-whitespace'

"窗口管理工具"
""Plugin 'WinManager'
"快速注释工具
Bundle 'scrooloose/nerdcommenter'

"cpp .h 间切换
Bundle 'derekwyatt/vim-fswitch'
Bundle 'a.vim'
Bundle 'c.vim'
"Plugin 'stl.vim'
Bundle 'stlrefvim'
Bundle 'cpp.vim'
Bundle 'https://github.com/Mizuchi/STL-Syntax'

"快速插入代码片段
Bundle 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

filetype plugin indent on    " required

highlight Comment ctermfg=DarkGrey guifg=blue
hi Search term=standout ctermfg=0 ctermbg=yellow

" 主题 molokai
let g:molokai_original = 1
" 配色方案 不同的模式有不同的效果哦
" 配色方案
set t_Co=256
if has('gui_running')
    colorscheme solarized
    "colorscheme molokai
    "colorscheme phd
else
    "colorscheme solarized
    colorscheme molokai
    "colorscheme phd
endif

" <<-------------------begin------------------------->
"set up NerdTree"
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeWinPos="left"
" 只剩 NERDTree时自动关闭

autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F7> :NERDTreeToggle<CR>


let Tlist_Inc_Winwidth=0        "                   //  配置打开函数列表的时候不改变窗口大小
let Tlist_Use_Right_Window=1    "                   //  配置函数列表挂靠在屏幕右手边
let Tlist_File_Fold_Auto_Close=1  "                 //  配置自动关闭非活动的文件
let Tlist_Exit_OnlyWindow=1        "                //  配置当前只有函数列表窗口的时候退出vim
"map <F4> :TlistToggle<CR>
nmap <F8> :TrinityToggleTagList<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Sort_Type = "name"    " 按照名称排序
"let Tlist_Use_Right_Window = 1  " 在右侧显示窗口
"let Tlist_Compart_Format = 1    " 压缩方式
"let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer
"let Tlist_WinWidth=40 "设置taglist宽度
"
"let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags
"let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags
set tags=tags;
set autochdir

"默认打开Taglist
"let Tlist_Auto_Open=0
""""""""""""""""""""""""""""""
"/Tag list (ctags)
""""""""""""""""""""""""""""""""
"let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口


" <<-------------------begin------------------------->
"记住上次打开的位置
set viminfo='10,\"100,:20,%,n~/.viminfobk
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"去掉多余的空格
map <leader><space> :FixWhitespace<cr>	" \+space去掉末尾空格



" <<-------------------begin------------------------->
"set up supertab"
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"<<-------------------begin------------------------->
"setup auto pair"
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" <<-------------------begin------------------------->
" 自动补全
" omnicppcomplete-0.41 ---- AutoComplPop
" 配置网址:http://blog.chinaunix.net/uid-30024978-id-4830530.html
"
"配置cpp.vim c.vim的自动不全
"set completeopt=menu,menuone
"let OmniCpp_MayCompleteDot=1    "打开  . 操作符
"let OmniCpp_MayCompleteArrow=1  "打开 -> 操作符
"let OmniCpp_MayCompleteScope=1  "打开 :: 操作符
"let OmniCpp_NamespaceSearch=1   "打开命名空间
"let OmniCpp_GlobalScopeSearch=1
"let OmniCpp_DefaultNamespace=["std"]
"let OmniCpp_ShowPrototypeInAbbr=1   "打开显示函数原型
"let OmniCpp_SelectFirstItem = 2     "自动弹出时自动跳至第一个
""
""要生成专用于c/c++的ctags文件，并引导vim找到改tags文件：
""tags文件生成命令（通常位于代码项目的最上层目录下执行）
""[admin@local]$ ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
""引导omnicppcomplete找到tags文件：
""（1）在vim中设置：set tags+=/home/project/project_1/tags 。该方法不方便，每次使用都要set一下
""（2）在~/.vimrc中添加常用的路径tags：
""set tags+=/home/project/project_1/tags
""set tags+=/home/project/project_2/tags
""这样，每次打开vim便会自动寻找以上设置的tags文件。另外，可以通过vim中：set tags来查看已设置的tags文件路径。
"解決右鍵不能複製粘貼問題

