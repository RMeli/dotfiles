-- [[ null-ls ]]
-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
-- https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

require("null-ls").setup({
	sources = {
		-- Lua
		formatting.stylua,
		-- C/C++/CUDA
		-- null_ls.builtins.diagnostics.clang_check,
		formatting.clang_format,
		-- CMake
		formatting.cmake_format,
		-- Fortran
		formatting.fprettify,
		-- Python
		formatting.black,
        diagnostics.flake8,
        diagnostics.mypy,
	},
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

