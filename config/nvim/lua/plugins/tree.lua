-- [[ nvim-tree ]]
-- A file explorer tree for neovim written in lua
-- https://github.com/nvim-tree/nvim-tree.lua

require("nvim-tree").setup({ filters = {
  dotfiles = true,
} })

-- [[ keymaps ]]

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
