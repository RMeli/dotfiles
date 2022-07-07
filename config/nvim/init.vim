set nocompatible

scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set encoding=utf-8

let mapleader=','

syntax enable

set autoread                    " reload file when changed from outside
set updatetime=300

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
set colorcolumn=80,120
set cmdheight=1                 " More space to display messages

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
set nobackup
set nowritebackup
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

" -------- indentLine --------- "

let g:indentLine_char = '|'
