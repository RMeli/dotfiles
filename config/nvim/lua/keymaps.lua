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

-- [[ diffview ]]

wk.register({
  ["<leader>gd"] = { "<cmd>DiffviewOpen<cr>", "Open diff view" },
  ["<leader>gq"] = { "<cmd>DiffviewClose<cr>", "Close diff view" },
  ["<leader>gh"] = { "<cmd>DiffviewFileHistory<cr>", "File history" },
})

-- [[ lsp ]]

local tb = require("telescope.builtin")

wk.register({
  ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to Declatation" },
  ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to Definition" },
  ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to Implementation" },
  ["gr"] = { tb.lsp_references, "Go to references" },
  -- LSP group
  ["<leader>lf"] = {
    "<cmd>lua vim.lsp.buf.format{ async = true }<cr>",
    "Format File",
  },
  ["<leader>li"] = {
    "<cmd>LspInfo<cr>",
    "LSP Info",
  },
  ["<leader>lI"] = {
    "<cmd>LspInstallInfo<cr>",
    "LSP Install Info",
  },
  ["<leader>lr"] = {
    "<cmd>lua vim.lsp.buf.rename()<cr>",
    "Rename",
  },
  ["<leader>ls"] = {
    "<cmd>lua vim.lsp.buf.signature_help()<cr>",
    "Signature Help",
  },
  ["<leader>la"] = {
    "<cmd>lua vim.lsp.buf.code_action()<cr>",
    "Code Action",
  },
})

-- [[ todo-comments ]]
-- FIXME: Jumps do not work (but work when typed excplicitly)
wk.register({
  ["<leader>ft"] = { "<cmd>:TodoTelescope<cr>", "TODOs" },
  ["]t"] = {
    "<cmd>lua require('todo-comments').jump_next()<cr>",
    desc = "Next todo comment",
  },
  ["[t"] = {
    "<cmd>lua require('todo-comments').jump_prev()<cr>",
    desc = "Previous todo comment",
  },
})

-- [[ toggleterm ]]

wk.register({
  --  ["<c-\\>"] = { "<cmd>ToggleTerm<cr>", "Open Terminal" },
  ["<leader>tg"] = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Open LazyGit Terminal" },
  ["<leader>th"] = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Open HTop Terminal" },
})

-- [[ tree ]]
wk.register({
  ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Toggle File Explorer" },
})

-- [[ telescope ]]

-- tb already defined above for [[ lsp ]]

wk.register({
  ["<leader>fb"] = { tb.bffers, "Buffers" },
  ["<leader>ff"] = { tb.find_files, "Files" },
  ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
  -- git
  --    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
  --    { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
  -- LSP
  --      { "<leader>lc", tb.find_outgoing_calls, "Outgoing Calls" },
  --      { "<leader>lC", tb.find_incoming_calls, "Incoming Calls" },
  --      { "<leader>ld", tb.lsp_definitions, "Definitions" },
  --      { "<leader>lD", tb.diagnostics, "Diagnostics" },
  --      { "<leader>li", tb.lsp_implementations, "Implementation" },
  --     { "<leader>lr", tb.references, "References" },
  --      { "<leader>lr", tb.lsp_document_symbols, "Symbols" },
  -- search
  --    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current Buffer" },
  --    { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
  --    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  --    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
  --    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
  --    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Highlight Groups" },
  --    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
  --    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  --    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
  --      { "<leader>sn", telescope.extensions.notify.notify, desc = "Notify" },
  --    { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
  --      { "<leader>sw", tb.grep_string, desc = "Word" },
  --      { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
})
