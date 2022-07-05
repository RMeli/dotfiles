set nocompatible
scriptencoding utf-8

set number

syntax enable

set fileencodings=utf-8
set encoding=UTF-8

" Spaces and tabs
set tabstop=4
set softtabstop=4
set expandtab                   " tabs are spaces
set smarttab
filetype plugin indent on

" UI
set number                      " line numbers
set showcmd                     " show command
set cursorline                  " highlight current line
filetype indent on              " filetype-specific indentation
set wildmenu                    " visual command autocomplete
set lazyredraw                  " redraw lazily
set showmatch                   " highlight matching brakets

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

" ---------- ------- ---------- "
" ---------- PLUGINS ---------- "
" ---------- ------- ---------- "

runtime ./vundle.vim
