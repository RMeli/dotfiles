set nocompatible

scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set encoding=utf-8

let mapleader=','

syntax enable

set autoread                    " reload file when changed from outside

" Spaces and tabs
set autoindent                  " auto-indent new lines
set smartindent
set smarttab
set tabstop=4
set softtabstop=4               " number of auto-indent spaces
set shiftwidth=4
set expandtab                   " tabs are spaces
filetype plugin indent on

" UI
set number                      " line numbers
set showcmd                     " show command
set cursorline                  " highlight current line
set wildmenu                    " visual command autocomplete
set lazyredraw                  " redraw lazily
set showmatch                   " highlight matching brakets
set ruler                       " row and column ruler information
set visualbell                  " use visual bell (no beeping)
set list
set lcs+=space:·                " Show spaces
set lcs+=eol:↴                  " Show End Of Line

" Searching
set incsearch                   " search as characters are typed
set hlsearch                    " highlight matches

" Folding
set foldenable                  " enable folding
set foldlevelstart=5
set foldnestmax=10
set foldmethod=indent           " fold based on indent level
" space open/closes folds
nnoremap <space> za

" Backup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set noswapfile

" Undo
set undofile
set undodir=$HOME/.config/nvim/undo

" ---------- ------- ---------- "
" ---------- PLUGINS ---------- "
" ---------- ------- ---------- "

runtime ./plugin.vim

" ---------- airline ---------- "

let g:airline_theme='minimalist'

" --------- NERDTree ---------- "

let g:NERDTreeWinPos = "right"

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

