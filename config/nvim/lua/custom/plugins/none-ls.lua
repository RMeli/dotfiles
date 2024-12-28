return {
  'nvimtools/none-ls.nvim', -- Repo name has changed, everything else is the same as null-ls
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    require('null-ls').setup {
      border = 'rounded',
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
        -- Use none-ls extras
        require 'none-ls.diagnostics.flake8',
        require 'none-ls.diagnostics.ruff',
        diagnostics.mypy,
      },
    }
  end,
}
