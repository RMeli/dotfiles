return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- [[ plenary ]]
    -- All the lua functions I don't want to write twice
    -- https://github.com/nvim-lua/plenary.nvim
    "nvim-lua/plenary.nvim",
  },
  opts = function()
    local nls = require("null-ls")
    local formatting = nls.builtins.formatting
    local diagnostics = nls.builtins.diagnostics
    return {
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
    }
  end,
}
