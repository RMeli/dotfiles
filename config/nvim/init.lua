-- -------------- --
-- [[ init.lua ]] --
-- -------------- --

vim.g.mapleader = ","
vim.g.localleader = "\\"

-- disable netrw
-- advised by [[ nvim-tree]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Reloads NeoVim whenever init.lua is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

-- require files in ./lua/ folder
require("vars")
require("setup")
require("plugins")

-- ------------- --
-- [[ plugins ]] --
-- ------------- --

-- Load plugin configurations

require("lua.plugins.github-nvim-theme")
require("lua.plugins.notify")
require("lua.plugins.nvim-tree")
require("lua.plugins.nvim-treesitter")
require("lua.plugins.lualine")
require("lua.plugins.cmp-nvim")
require("lua.plugins.alpha-nvim")
require("lua.plugins.indent-blankline")
require("lua.plugins.telescope")

-- LSP
require("lua.plugins.lsp.mason")

-- [[ toggleterm.nvim ]]
require("toggleterm").setup()

-- [[ bufferline.nvim ]]
require("bufferline").setup({})

-- [[ Comment.nvim ]]
require("Comment").setup()


-- [[
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.completion.vsnip,
    -- Lua
    null_ls.builtins.formatting.stylua,
    -- C/C++/CUDA
    -- null_ls.builtins.diagnostics.clang_check,
    null_ls.builtins.formatting.clang_format,
    -- CMake
    null_ls.builtins.diagnostics.cmake_lint,
    null_ls.builtins.formatting.cmake_format,
    -- Fortran
    null_ls.builtins.formatting.fprettify,
    --
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
  },
})

-- Allows to add nvim-cmp support to LSPs
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
capabilities.offsetEncoding = { "utf-16" } -- Use same offset encoding as null-ls

-- [[ nvim-lspconfig ]]
require("lspconfig").bashls.setup({ capabilities = capabilities })
require("lspconfig").clangd.setup({ capabilities = capabilities })
require("lspconfig").cmake.setup({ capabilities = capabilities })
require("lspconfig").dockerls.setup({ capabilities = capabilities })
require("lspconfig").fortls.setup({ capabilities = capabilities })
require("lspconfig").julials.setup({ capabilities = capabilities })
require("lspconfig").ltex.setup({ capabilities = capabilities })
require("lspconfig").sumneko_lua.setup({ 
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "Lua 5.1"
            },
            completion = {
                showWord = "Disable",
            },
            diagnostics = {
		globals = { "vim" },
	    },
        }
    }
})
require("lspconfig").ltex.setup({ capabilities = capabilities })
require("lspconfig").sumneko_lua.setup({ capabilities = capabilities })
require("lspconfig").pyright.setup({ capabilities = capabilities })
require("lspconfig").taplo.setup({ capabilities = capabilities })
require("lspconfig").yamlls.setup({ capabilities = capabilities })
