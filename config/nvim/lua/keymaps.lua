-- [[keymaps]]
-- General NVim keymaps
-- Key maps related to plugins are defined at the bottom of the corresponding
-- plugin file

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- --------------------------- --
-- Keymaps for normal mode (n) --
-- --------------------------- --
-- Window navigation
-- Remove need for w (window) key
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Bugger navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)

-- Move line up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- --------------------------- --
-- Keymaps for insert mode (i) --
-- --------------------------- --

-- Move line up and down
keymap("i", "<A-j>", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<ESC>:m .-2<CR>==gi", opts)

-- --------------------------- --
-- Keymaps for visual mode (V) --
-- --------------------------- --

-- Indendation
keymap("v", ">", ">gv", opts) -- Increase indentation while keeping selection
keymap("v", "<", "<gv", opts) -- Decrement indentation while keeping selection

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
