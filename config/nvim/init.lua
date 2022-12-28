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
