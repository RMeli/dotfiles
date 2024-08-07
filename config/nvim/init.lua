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
require("utils")
require("vars")
require("setup")
require("keymaps")
require("plugins.lsp.keymaps")
require("plugins")

-- Require impatient login if available
pcall(require, "impatient")

-- ------------- --
-- [[ plugins ]] --
-- ------------- --

-- Load plugin configurations
require("plugins.colorschemes")
require("plugins.whichkey")
require("plugins.notify")
require("plugins.tree")
require("plugins.treesitter")
require("plugins.lualine")
require("plugins.cmp")
require("plugins.alpha")
require("plugins.indent-blankline")
require("plugins.telescope")
require("plugins.toggleterm")
require("plugins.bufferline")
require("plugins.comment")
require("plugins.gitsigns")
require("plugins.autopairs")
require("plugins.project")
require("plugins.trouble")
require("plugins.todo-comments")
require("plugins.persistence")
require("plugins.hop")
require("plugins.diffview")

-- LSP
require("plugins.lsp.mason")
require("plugins.lsp.none-ls")
require("plugins.lsp.lspconfig")
