-- --------------- --
-- [[ setup.lua ]] --
-- --------------- --

local opt = vim.opt

opt.compatible      = false

opt.autoread        = true      -- reload file when changed from outside
opt.updatetime      = 300

-- [[ filetypes ]]
opt.encoding        = "utf-8"   -- string encoding
opt.fileencoding    = "utf-8"   -- file encoding

-- [[ context ]]
opt.colorcolumn     = "80,120"
opt.number          = true      -- show line numbers
opt.relativenumber  = false     -- show relative line numbers
opt.cursorline      = true      -- highlight current line
opt.showmatch       = true      -- highlight matching brakets
opt.list            = true
opt.showbreak       = "↪"
opt.lcs             = "tab:→ ,trail:-,nbsp:+,space:·,eol:↴"

-- set showcmd                     " show command
-- set wildmenu                    " visual command autocomplete
-- set lazyredraw                  " redraw lazily
-- set ruler                       " row and column ruler information
-- set visualbell                  " use visual bell (no beeping)
-- set cmdheight=1                 " More space to display messages
-- opt.signcolumn = "yes"
-- opt.scrolloff = 4

-- [[ whitespace ]]
opt.autoindent      = true      -- auto-indent new lines
opt.smartindent     = true
opt.smarttab        = true
opt.tabstop         = 4         -- numbef of spaces
opt.softtabstop     = 4         -- number of spaces in inserti mode
opt.shiftwidth      = 4         -- indent size
opt.expandtab       = true      -- tabs are spaces

-- [[ splits ]]
opt.splitright      = true      -- place new window to the right of current
opt.splitbelow      = true      -- place new window below current

-- [[ search ]]
opt.ignorecase      = true      -- ignore case in search patterns
opt.smartcase       = true      -- override ignorecase if search contains caps
opt.incsearch       = true      -- use incremental search
opt.hlsearch        = true      -- highlight search matches

-- [[ theme ]]
opt.syntax          = "ON"      -- allow syntax highlighting
opt.termguicolors   = true      -- enable term ui colors


