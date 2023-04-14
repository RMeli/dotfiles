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

-- Split window
keymap("n", "<leader>s", "<cmd>vsplit<cr>", opts)
keymap("n", "<leader>sh", "<cmd>split<cr>", opts)

-- Quit
keymap("n", "<leader>Q", "<cmd>wqa<cr>", opts)

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

--wk = require("which-key")
--tb = require("telescope.builtin")
--wk.register({
--  ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to Declatation" },
-- ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to Definition" },
--  ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to Implementation" },
--  ["gr"] = { tb.lsp_references, "Go to references" },
-- LSP group
--  ["<leader>l"] = { name = "+LSP" },
--  ["<leader>lf"] = {
--   "<cmd>lua vim.lsp.buf.format{ async = true }<cr>",
--    "Format File",
--  },
--  ["<leader>li"] = {
--    "<cmd>LspInfo<cr>",
--    "LSP Info",
--  },

--  ["<leader>lI"] = {
--    "<cmd>LspInstallInfo<cr>",
--    "LSP Install Info",
--  },
--  ["<leader>lr"] = {
--    "<cmd>lua vim.lsp.buf.rename()<cr>",
--    "Rename",
-----  },
--  ["<leader>ls"] = {
--    "<cmd>lua vim.lsp.buf.signature_help()<cr>",
--    "Signature Help",
--  },
--  ["<leader>la"] = {
--    "<cmd>lua vim.lsp.buf.code_action()<cr>",
--    "Code Action",
--  },
--})
--

local wk = require("which-key")

-- ------------------- --
-- Keymaps for plugins --
-- ------------------- --

-- [[ tree ]]
wk.register({
  ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Toggle File Explorer" },
})

-- [[ toggleterm ]]

wk.register({
  --  ["<c-\\>"] = { "<cmd>ToggleTerm<cr>", "Open Terminal" },
  ["<leader>tg"] = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Open LazyGit Terminal" },
  ["<leader>th"] = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Open HTop Terminal" },
})
