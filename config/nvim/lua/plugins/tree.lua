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
    icons = {
      hint = "ﱴ",
      info = "",
      warning = "",
      error = "",
    },
  },
})

-- [[ keymaps ]]
local wk = require("which-key")

wk.register({
  ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Toggle File Explorer" },
})
