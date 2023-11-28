local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  b.formatting.stylua, -- Lua
  b.formatting.clang_format, -- C/C++
  b.formatting.fprettify, -- Fortran
  -- Python
  b.formatting.black,
  b.formatting.isort,
  b.diagnostics.flake8,
  b.diagnostics.mypy,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
