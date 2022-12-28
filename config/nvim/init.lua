-- -------------- --
-- [[ init.lua ]] --
-- -------------- --

vim.g.mapleader = ","
vim.g.localleader = "\\"

-- disable netrw
-- advised by [[ nvim-tree]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- require files in ./lua/ folder
require("vars")
require("setup")
require("plugins")

-- ------------- --
-- [[ plugins ]] --
-- ------------- --

-- [[ nvim-tree ]]
require("nvim-tree").setup()

-- [[ github-theme ]]
require('github-theme').setup()

-- [[ nvim-treesitter ]]
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash", "c", "cmake", "cpp", "cuda", "latex", "lua", "make",
        "markdown", "python", "toml", "vim", "yaml"
    },
    auto_install = true, -- automatically install missing parsers
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- [[ lualine ]]
require('lualine').setup {
    options = {
        theme = 'auto',
    }
}

-- [[ telescope.nvim ]]
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}

-- [[ indent-blankline.nvim ]]
require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
}

-- [[ toggleterm.nvim ]]
require("toggleterm").setup()

-- [[ bufferline.nvim ]]
require("bufferline").setup{}

-- [[ Comment.nvim ]]
require('Comment').setup()

-- [[ alpha-nvim ]]
require'alpha'.setup(require'alpha.themes.dashboard'.config)

-- [[ gitsigns.nvim ]]
require('gitsigns').setup {
    signs = {
        add = {
            hl = 'GitSignsAdd',
            text = '+',
            numhl = 'GitSignsAddNr',
            linehl = 'GitSignsAddLn'
        },
        change = {
            hl ='GitSignsChange',
            text = '│',
            numhl = 'GitSignsChangeNr',
            linehl = 'GitSignsChangeLn'
        },
        delete = {
            hl = 'GitSignsDelete',
            text = '-',
            numhl='GitSignsDeleteNr',
            linehl='GitSignsDeleteLn'
        },
        topdelete = {
            hl = 'GitSignsDelete',
            text = '‾',
            numhl='GitSignsDeleteNr',
            linehl='GitSignsDeleteLn'
        },
        changedelete = {
            hl = 'GitSignsChange',
            text = '~',
            numhl='GitSignsChangeNr',
            linehl='GitSignsChangeLn'
        },
        untracked = {
            hl = 'GitSignsAdd',
            text = '┆',
            numhl='GitSignsAddNr',
            linehl='GitSignsAddLn'
        },
    },
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 500,
        ignore_whitespace = true,
    },
}

-- [[ mason.nvim ]]
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- [[ mason-lspconfig.nvim ]]
require("mason-lspconfig").setup {
    ensure_installed = {
        "bashls",                   -- Bash
        "clangd",                   -- C and C++
        "cmake",                    -- CMake
        "dockerls",                 -- Docker
        "fortls",                   -- Fortran
        "julials",                  -- Julia
        "ltex",                     -- LaTeX
        "sumneko_lua",              -- Lua
        "pyright",                  -- Python
        "taplo",                    -- TOML
        "yamlls"                    -- YAML
    }
}

-- [[ nvim-slpconfig ]]
require'lspconfig'.bashls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.cmake.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.fortls.setup{}
require'lspconfig'.julials.setup{}
require'lspconfig'.ltex.setup{}
require'lspconfig'.sumneko_lua.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.taplo.setup{}
require'lspconfig'.yamlls.setup{}
