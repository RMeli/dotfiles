-- [[ null-ls ]]
-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
-- https://github.com/jose-elias-alvarez/null-ls.nvim

local ok, null_ls = pcall(require, "null-ls")
if not ok then
  vim.notify("require('null-ls') failed!")
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

require("null-ls").setup({
  border = "rounded",
  sources = {
    -- Lua
    formatting.stylua.with({
      extra_args = { "--indent-width", "2", "--indent-type", "Spaces" },
    }),
    -- C/C++/CUDA
    -- null_ls.builtins.diagnostics.clang_check,
    formatting.clang_format,
    -- CMake
    formatting.cmake_format,
    -- Fortran
    formatting.fprettify,
    -- Python
    formatting.black,
    formatting.isort,
    diagnostics.flake8,
    diagnostics.mypy,
  },
})

-- [[ keymaps ]]

local wk = require("which-key")

wk.register({
  ["<leader>l"] = { name = "+LSP" },
  ["<leader>lf"] = {
    "<cmd>lua vim.lsp.buf.format{ async = true }<cr>",
    "Format File",
  },
})
