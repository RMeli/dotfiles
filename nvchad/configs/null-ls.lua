local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
	-- formatting
	b.formatting.stylua, -- Lua
	b.formatting.clang_format, -- C/C++
	b.formatting.fprettify, -- Fortran
	b.formatting.black, -- Python
	b.formatting.isort, -- Python
	-- code actions
	b.code_actions.shellcheck, -- shell
	-- dagnostixs
	b.diagnostics.cmake_lint, -- CMake
	b.diagnostics.flake8, -- Python
	b.diagnostics.mypy, -- Python
}

null_ls.setup({
	debug = true,
	sources = sources,
})
