-- -------------- --
-- [[ init.lua ]] --
-- -------------- --

vim.g.mapleader = ","
vim.g.localleader = "\\"

-- disable netrw
-- advised by [[ nvim-tree]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Reloads NeoVim whenever init.lua is saved
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost init.lua source <afile> | PackerSync
    augroup end
]])

-- require files in ./lua/ folder
require("vars")
require("setup")
require("keymaps")
require("plugins")

-- ------------- --
-- [[ plugins ]] --
-- ------------- --

-- Load plugin configurations

require("plugins.colorschemes")
require("plugins.which-key")
require("plugins.notify")
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")
require("plugins.lualine")
require("plugins.cmp-nvim")
require("plugins.alpha-nvim")
require("plugins.indent-blankline")
require("plugins.telescope")
require("plugins.toggleterm")
require("plugins.bufferline")
require("plugins.comment")
require("plugins.gitsigns")

-- LSP
require("plugins.lsp.mason")
require("plugins.lsp.null-ls")
require("plugins.lsp.lspconfig")
