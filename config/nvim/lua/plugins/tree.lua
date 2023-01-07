-- [[ nvim-tree ]]
-- A file explorer tree for neovim written in lua
-- https://github.com/nvim-tree/nvim-tree.lua

require("nvim-tree").setup({
  filters = { dotfiles = true },
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = "after",
      symlink_arrow = " ➛ ",
      show = {
        file = true, -- show file icons
        folder = true, -- show folder icons
        folder_arrow = true, -- ?
        git = true, -- show git icons
      },
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
})

-- [[ keymaps ]]

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
