"==================="
"1.基本设置"
"==================="
"按TAB键时命令行自动补齐,显示补齐命令"
set wildmenu

"显示行号
set nu "显示行号

"开启语法高亮功能
sy on

"设置编码格式为utf-8
set enc=utf-8

"显示当前光标位置"
set ruler

"文件在Vim之外修改过，自动重新读入"
set autoread

"设置自动保存内容"
set autowrite

"当前目录随着被编辑文件的改变而改变"
"set autochdir

"使用vim而非vi，设置与vi不兼容模式"
set nocp

"开启鼠标 a:所有模式  v：可视模式
"set mouse=v

" 关闭下划线显示
"set nocursorline

" 设置折行文本宽度
set textwidth=1000

" 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set ttimeout

" 功能键超时检测 50 毫秒
set ttimeoutlen=50

"设置 <leader> 为 空格键
let mapleader = "\<space>"

"F11来支持切换paste和nopaste状态。
"set pastetoggle=<F11>

" 设置 leader+n 开关行号
noremap <silent>  <leader>n :set nonu!<cr>

" 设置 leader+l 开关 list
noremap <silent>  <leader>l :set nolist!<cr>

" 设置 leader+v 选择到当前行尾
noremap <silent>  <leader>v vg_

" 设置 leader+w quick save
noremap <silent>  <leader>w :w<cr>_


"============="
"2. 设置缩进"
"============="
"c/c++自动缩进"
set cindent
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab

" 设置 leader+e 开关 expandtab
noremap <silent> <leader>e :set noet!<cr>

"============="
"3. 显示字符 空格 tab"
"============="
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set list
colorscheme desert


"================="
"4 当前文件内搜索选项"
"================="
"开启搜索结果的高亮显示"
set hlsearch

"边输入边搜索(实时搜索)"
set incsearch

" 设置搜索高亮颜色, 文本中取消高亮, 输入  :noh
hi Search  term=reverse ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow

"搜索时忽略大小写
set ignorecase

"有一个或以上大写字母时仍大小写敏感
set smartcase

"显示未敲完的命令
set showcmd


"========================"
"5.txt文件按照wiki语法高亮"
"========================"
 autocmd BufNewFile *.txt set ft=confluencewiki
 autocmd BufEnter *.txt set ft=confluencewiki


"=========================="
"6.不要交换文件和备份文件，减少冲突，保留撤销能力到 undodir"
"=========================="
set noswapfile
"set nowritebackup
set nobackup
set undofile
set undodir=~/.vim/undodir
if !isdirectory(&undodir)
    call mkdir(&undodir, 'p', 0700)
endif


"=========================="
"7. other"
"=========================="
"change word to uppercase, I love this very much
inoremap <C-u> <esc>gUiwea

" set jj is Esc in insert mode
inoremap jj <Esc>

"----------------------------------------------------------------------
" 终端下允许 ALT，详见：http://www.skywind.me/blog/archives/2021
" 记得设置 ttimeout （见 init-basic.vim） 和 ttimeoutlen （上面）
"----------------------------------------------------------------------
if has('nvim') == 0 && has('gui_running') == 0
  function! s:metacode(key)
      exec "set <M-".a:key.">=\e".a:key
  endfunc
  for i in range(10)
      call s:metacode(nr2char(char2nr('0') + i))
  endfor
  for i in range(26)
      call s:metacode(nr2char(char2nr('a') + i))
      call s:metacode(nr2char(char2nr('A') + i))
  endfor
  for c in [',', '.', '/', ';', '{', '}']
      call s:metacode(c)
  endfor
  for c in ['?', ':', '-', '_', '+', '=', "'"]
      call s:metacode(c)
  endfor
endif


"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
" 使用 SecureCRT/XShell 等终端软件需设置：Backspace sends delete
" 详见：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> gk
noremap <C-l> gl
inoremap <C-n> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>


"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
cnoremap <c-n> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-right>
cnoremap <c-b> <c-left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>


"----------------------------------------------------------------------
" plug.vim
"----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'justinmk/vim-dirvish'

"Plug 'ludovicchabant/vim-gutentags'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
"
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

Plug 'Shougo/echodoc.vim'
"
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1

Plug 'tpope/vim-surround'

call plug#end()
