-- [[ none-ls ]]
-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
-- https://github.com/nvimtools/none-ls.nvim

-- NOTE: The repo is called none-ls, but the tools is a fork of null-ls.
--       The original name for the package remains unchanged.

local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

require("null-ls").setup({
  border = "rounded",
  sources = {
    -- Lua
    -- formatting.stylua.with({
    --   extra_args = { "--indent-width", "2", "--indent-type", "Spaces" },
    -- }),
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
    -- diagnostics.flake8, -- https://github.com/nvimtools/none-ls.nvim/issues/58
    diagnostics.mypy,
  },
})
