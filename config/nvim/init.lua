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
require("keymaps")
require("plugins")

-- ------------- --
-- [[ plugins ]] --
-- ------------- --

-- Load plugin configurations

require("plugins.colorschemes")
require("plugins.notify")
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")
require("plugins.lualine")
require("plugins.cmp-nvim")
require("plugins.alpha-nvim")
require("plugins.indent-blankline")
require("plugins.telescope")
require("plugins.toggleterm")
require("plugins.bufferline")
require("plugins.comment")
require("plugins.gitsigns")

-- LSP
require("plugins.lsp.mason")
require("plugins.lsp.null-ls")

-- Allows to add nvim-cmp support to LSPs
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
capabilities.offsetEncoding = { "utf-16" }

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
        version = "Lua 5.1",
      },
      completion = {
        showWord = "Disable",
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
require("lspconfig").ltex.setup({ capabilities = capabilities })
require("lspconfig").pyright.setup({ capabilities = capabilities })
require("lspconfig").taplo.setup({ capabilities = capabilities })
require("lspconfig").yamlls.setup({ capabilities = capabilities })
