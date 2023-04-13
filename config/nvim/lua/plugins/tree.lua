-- [[ nvim-tree ]]
-- A file explorer tree for neovim written in lua
-- https://github.com/nvim-tree/nvim-tree.lua

return {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  cmd = { "NvimTree", "NvimTreeToggle" },
  event = "BufEnter", -- Load when opening a directory
  opts = {
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
    -- [[ project ]]
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
  },
}
