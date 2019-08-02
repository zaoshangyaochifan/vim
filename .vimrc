"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set relativenumber       " 相对行号
set cursorline           " 高亮显示当前行
" set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
" " set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 代码缩进和排版
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
" set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
" set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
" set nowrap               " 禁止折行
set wrap
" set backspace=0         " 与set backspace=相同
" set backspacej1         " 与set backspace=indent,eol相同
" set backspace=2         " 与set backspace=indent,eol,start相同
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
" set scrolljump=5         " 光标到达窗口上下边缘时滚动的行数
set scrolloff=10         " b光标距离窗口上下边缘n行时滚动
set nofoldenable         " 禁用折叠代码

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 代码补全
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表
"
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 搜索设置
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
exec "nohlsearch"
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 缓存设置
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 编码设置
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " 插件列表
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


noremap s <nop>
noremap <LEADER>w :w<CR>
noremap <LEADER>q :q<CR>
noremap <LEADER>r :source $MYVIMRC<CR>
noremap <LEADER>e :edit $MYVIMRC<CR>

" colorscheme
set background=dark
let g:onedark_termcolors=256
colorscheme gruvbox
" colorscheme mojave

" airline
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''

" ctags
set tags+=/usr/include/tags
set tags+=~/.vim/systags
set tags+=~/.vim/x86_64-linux-gnu-systags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.','re![_a-zA-z0-9]'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s', 're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&',']']

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '>'
let g:ycm_warning_symbol = '*'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_python_binary_path = 'python3'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

nnoremap <leader>o :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>O :YcmCompleter GoToDefinition<cr>
nnoremap <leader>i :YcmCompleter GoToInclude<cr>
nnoremap <leader>ff :YcmCompleter FixIt<cr>

" nerdtree
" map <silent> <leader>n :NERDTreeToggle<cr>
map <leader>n :NERDTreeToggle<cr>
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeKeepTreeInNewTab=2
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
