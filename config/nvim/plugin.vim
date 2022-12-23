
" Install plugins using ':PluginInstall'
" Vimdoc for more details with ':h vundle'

filetype off " required

" Vundle is short for Vim bundle and is a Vim plugin manager
"   https://github.com/VundleVim/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" A Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

" A Vim plugin which shows git diff markers in the sign column and
" stages/previews/undoes hunks and partial hunks.
Plugin 'airblade/vim-gitgutter'

" Yet another EditorConfig pluding for vim
Plugin 'sgur/vim-editorconfig'

" Plugin 'neoclide/coc.nvim'
" Plugin 'josa42/coc-sh'
" Plugin 'clangd/coc-clangd'
" Plugin 'voldikss/coc-cmake'
" Plugin 'fannheyward/coc-pyright' " Pyright extension for coc.nvim

" A vim plugin to display the indentation levels with thin vertical lines
Plugin 'Yggdroot/indentLine'

" A tree explorer plugin for vim.
Plugin 'preservim/nerdtree'

" Vim undo tree visualizer
Plugin 'simnalamburt/vim-mundo'

" Adds file type icons to Vim plugins
" Need Nerd Fonts installed: https://github.com/ryanoasis/nerd-fonts
Plugin 'ryanoasis/vim-devicons'

" Lightweight Toolbox for LaTeX
Plugin 'LaTeX-Box-Team/LaTeX-Box'

if has("nvim")

    " Quickstart configs for Nvim Language Server Protocol (LSP)
    " Plugin 'neovim/nvim-lspconfig'

    " Neovim LSP plugin
    " Plugin 'glepnir/lspsaga.nvim'

    " Nvim Treesitter configurations and abstraction layer
    Plugin 'nvim-treesitter/nvim-treesitter'

    " Find, Filter, Preview, Pick. All lua, all the time
    Plugin 'nvim-lua/plenary.nvim'
    Plugin 'nvim-telescope/telescope.nvim'

    " Github theme for Neovim
    Plugin 'projekt0n/github-nvim-theme'

endif

call vundle#end()
filetype plugin indent on " required
