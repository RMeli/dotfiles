-- [[keymaps]]
-- General NVim keymaps
-- Key maps related to plugins are defined at the bottom of the corresponding
-- plugin file

local opts = {noremap = true, silent = true}

local keymap = vim.api.nvim_set_keymap

-- --------------------------- --
-- Keymaps for normal mode (n) --
-- --------------------------- --

-- Window navigation
-- Remove need for w (window) key
keymap('n', "<C-h>", "<C-w>h", opts)
keymap('n', "<C-j>", "<C-w>j", opts)
keymap('n', "<C-k>", "<C-w>k", opts)
keymap('n', "<C-l>", "<C-w>l", opts)

-- --------------------------- --
-- Keymaps for insert mode (i) --
-- --------------------------- --

