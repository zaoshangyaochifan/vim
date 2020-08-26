call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

let mapleader = ","      " 定义<leader>键
" set nocompatible         " 设置不兼容原始vi模式
" filetype on              " 设置开启文件类型侦测
" filetype plugin on       " 设置加载对应文件类型的插件
" set noeb                 " 关闭错误的提示
" syntax enable            " 开启语法高亮功能
" syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
" set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
" set relativenumber       " 相对行号
set cursorline           " 高亮显示当前行
" set whichwrap+=<,>,h,l   " 设置光标键跨行
" set ttimeoutlen=0        " 设置<ESC>键响应时间
set expandtab            " 将制表符扩展为空格
" set tabstop=4            " 设置编辑时制表符占用空格数
" set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set scrolloff=10         " b光标距离窗口上下边缘n行时滚动
set hlsearch            " 高亮显示搜索结果
exec "nohlsearch"
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认
set wildmenu            " vim自身命名行模式智能补全
" set completeopt-=preview " 补全时不显示窗口，只显示补全列表

noremap s <nop>
noremap <LEADER>w :w<CR>
noremap <LEADER>q :q<CR>
noremap <LEADER>x :x<CR>
noremap <LEADER>r :source $MYVIMRC<CR>
noremap <LEADER>e :edit $MYVIMRC<CR>
" 分屏
noremap <LEADER>h :set nosplitright<CR>:vsplit<CR>
noremap <LEADER>l :set splitright<CR>:vsplit<CR>
noremap <LEADER>k :set nosplitbelow<CR>:split<CR>
noremap <LEADER>j :set splitbelow<CR>:split<CR>
noremap <up> :resize -5<CR>
noremap <down> :resize +5<CR>
noremap <left> :vertical resize -5<CR>
noremap <right> :vertical resize +5<CR>
" 多标签
noremap tn :tabe<CR>
noremap t- :-tabnext<CR>
noremap t= :+tabnext<CR>
" colorscheme
set background=dark
" let g:onedark_termcolors=256
" colorscheme gruvbox
" colorscheme anderson
" colorscheme mojave
" colorscheme atom
colorscheme PaperColor
" airline
let g:airline_theme="onedark"
 let g:airline_powerline_fonts = 1
 let g:airline#extensions#tabline#enabled = 1
 if !exists('g:airline_symbols')
    let g:airline_symbols = {}
 endif
    let g:airline_left_sep = '<'
    let g:airline_left_alt_sep = '<<'
    let g:airline_right_sep = '>'
    let g:airline_right_alt_sep = '>>'
" nerdtree
" map <silent> <leader>n :NERDTreeToggle<cr>
map <LEADER>t :NERDTreeToggle<cr>
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeKeepTreeInNewTab=2
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
if has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Mappings for CoCList
" " Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
