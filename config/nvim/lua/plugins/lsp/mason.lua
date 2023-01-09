-- [[ mason ]]
-- Portable package manager for Neovim that runs everywhere Neovim runs
-- https://github.com/williamboman/mason.nvim
-- [[ mason-lspconfig ]]
-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim

require("mason").setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    },
})

-- [[ mason-lspconfig.nvim ]]
require("mason-lspconfig").setup({
    ensure_installed = {
        --        "bashls", -- Bash
        --        "clangd", -- C and C++
        --        "cmake", -- CMake
        --        "dockerls", -- Docker
        --        "fortls", -- Fortran
        --        "julials", -- Julia
        --        "ltex", -- LaTeX
        --        "sumneko_lua", -- Lua
        --        "pyright", -- Python
        --        "taplo", -- TOML
        --        "yamlls", -- YAML
    },
})
