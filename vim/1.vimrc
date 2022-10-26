"==================="
"1.基本设置"
"==================="
set wildmenu"按TAB键时命令行自动补齐,显示补齐命令"
set nu "显示行号
sy on "开启语法高亮功能"
set enc=utf-8 "设置编码格式为utf-8
set ruler "显示当前光标位置"
set autoread "文件在Vim之外修改过，自动重新读入"
set autowrite "设置自动保存内容"
"set autochdir "当前目录随着被编辑文件的改变而改变"
set nocp "使用vim而非vi，设置与vi不兼容模式"
"set mouse=v  "开启鼠标 a:所有模式  v：可视模式
set nocursorline " 关闭下划线显示

"设置 <leader> 为 空格键
let mapleader = "\<space>"
"set pastetoggle=<F11> "F11来支持切换paste和nopaste状态。"


"============="
"2. 设置缩进"
"============="
set cindent "c/c++自动缩进"
set smartindent~
set shiftwidth=4
set tabstop=4
set expandtab

"============="
"3. 显示字符 空格 tab"
"============="                                                                                      
set listchars=tab:>-,trail:~                                                                         
set list                                                                                             
colorscheme desert                                                                                   
                                                                                                     
"================="                                                                                  
"4 当前文件内搜索选项"                                                                               
"================="                                                                                  
set hlsearch "开启搜索结果的高亮显示"                                                                
set incsearch "边输入边搜索(实时搜索)"                                                               
" 设置搜索高亮颜色, 文本中取消高亮, 输入  :noh                                                       
hi Search  term=reverse ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow                                 
set ignorecase "搜索时忽略大小写                                                                
set smartcase  "有一个或以上大写字母时仍大小写敏感                                              
set showcmd    "显示未敲完的命令  

"========================"
"5.txt文件按照wiki语法高亮"
"========================"
 autocmd BufNewFile *.txt set ft=confluencewiki~
 autocmd BufEnter *.txt set ft=confluencewiki

"=========================="
"6.不要交换文件和备份文件，减少冲突，保留撤销能力到 undodir"
"=========================="
"set noswapfile
"set nowritebackup
set nobackup
set undodir=~/.vim/undodir
if !isdirectory(&undodir)
    call mkdir(&undodir, 'p', 0700)
endif

"----------------------------------------------------------------------
" Movement Enhancement
"----------------------------------------------------------------------
noremap ^[h b
noremap ^[l w
noremap ^[j gj
noremap ^[k gk
"inoremap ^[h <C-left>
"inoremap ^[l <C-right>
"inoremap ^[j <C-\><C-o>gj
"inoremap ^[k <C-\><C-o>gk
"inoremap ^[y <C-\><C-o>d$
cnoremap ^[h <C-left>
cnoremap ^[l <C-right>
cnoremap ^[b <C-left>
cnoremap ^[f <C-right>

"----------------------------------------------------------------------
" plug.vim
"----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'

Plug 'ludovicchabant/vim-gutentags'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-signify', { 'tag': 'legacy' }

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

Plug 'Shougo/echodoc.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1

"Plug 'ycm-core/YouCompleteMe'

call plug#end()

"----------------------------------------------------------------------
" confin-plug.vim
"----------------------------------------------------------------------
so ~/.vim/config-plug/config-plug.vim
