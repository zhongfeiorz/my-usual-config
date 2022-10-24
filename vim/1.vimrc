set nu
sy on
set ruler
set smartindent shiftwidth=4
set tabstop=4
set expandtab

set listchars=tab:>-,trail:~
set list
colorscheme desert

set hlsearch
"文本中取消高亮 输入  :noh

"映射 esc 键，有坑，上下左右 会被识别成字母，并进入插入模式 不建议映射 esc 键 
"nnoremap <esc> :noh<return><esc> "normal模式 按 esc 关闭当前高亮搜索  
"set mouse=a
hi Search  term=reverse ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow
"set autowrite


call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'

Plug 'ludovicchabant/vim-gutentags'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-signify', { 'tag': 'legacy' }

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

Plug 'Shougo/echodoc.vim'

"Plug 'ycm-core/YouCompleteMe'

call plug#end()

so ~/.vim/config-plug/config-plug.vim

" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"YCM
"let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
