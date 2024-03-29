" VIMRC
"
" Based on:
"   - https://dougblack.io/words/a-good-vimrc.html
"   - https://github.com/dougblack/dotfiles/blob/master/.vimrc

" Colors
"colorscheme badwolf
syntax enable

" Spaces and tabs
set tabstop=4
set softtabstop=4
set expandtab               " tabs are spaces

" UI
set number                  " line numbers
set showcmd                 " show command
set cursorline              " highlight current line
filetype indent on          " filetype-specific indentation
set wildmenu                " visual command autocomplete
set lazyredraw              " redraw lazily
set showmatch               " highlight matching brakets

" Searching
set incsearch               " search as characters are typed
set hlsearch                " highlight matches

" Folding
set foldenable              " enable folding
set foldlevelstart=5
set foldnestmax=10
set foldmethod=indent       " fold based on indent level
" space open/closes folds
nnoremap <space> za

" Backup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

