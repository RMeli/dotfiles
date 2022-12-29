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
require("lua.plugins.nvim-tree")
require("lua.plugins.nvim-treesitter")
require("lua.plugins.lualine")

-- LSP Plugins

-- Patches

-- [[ nvim-notify ]]
vim.notify = require("notify")

-- [[ telescope.nvim ]]
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
local actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  },
})

-- [[ indent-blankline.nvim ]]
require("indent_blankline").setup({
  show_end_of_line = true,
  space_char_blankline = " ",
})

-- [[ toggleterm.nvim ]]
require("toggleterm").setup()

-- [[ bufferline.nvim ]]
require("bufferline").setup({})

-- [[ Comment.nvim ]]
require("Comment").setup()

-- [[ alpha-nvim ]]
require("alpha").setup(require("alpha.themes.dashboard").config)


-- [[ mason.nvim ]]
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- [[ mason-lspconfig.nvim ]]
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls", -- Bash
    "clangd", -- C and C++
    "cmake", -- CMake
    "dockerls", -- Docker
    "fortls", -- Fortran
    "julials", -- Julia
    "ltex", -- LaTeX
    "sumneko_lua", -- Lua
    "pyright", -- Python
    "taplo", -- TOML
    "yamlls", -- YAML
  },
})

-- [[
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.completion.vsnip,
    -- Lua
    null_ls.builtins.formatting.stylua,
    -- C/C++/CUDA
    null_ls.builtins.diagnostics.clang_check,
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

-- [[ nvim-lspconfig ]]
require("lspconfig").bashls.setup({ capabilities = capabilities })
require("lspconfig").clangd.setup({ capabilities = capabilities })
require("lspconfig").cmake.setup({ capabilities = capabilities })
require("lspconfig").dockerls.setup({ capabilities = capabilities })
require("lspconfig").fortls.setup({ capabilities = capabilities })
require("lspconfig").julials.setup({ capabilities = capabilities })
require("lspconfig").ltex.setup({ capabilities = capabilities })
require("lspconfig").sumneko_lua.setup({ capabilities = capabilities })
require("lspconfig").ltex.setup({ capabilities = capabilities })
require("lspconfig").sumneko_lua.setup({ capabilities = capabilities })
require("lspconfig").pyright.setup({ capabilities = capabilities })
require("lspconfig").taplo.setup({ capabilities = capabilities })
require("lspconfig").yamlls.setup({ capabilities = capabilities })
