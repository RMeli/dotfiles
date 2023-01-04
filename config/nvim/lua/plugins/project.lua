-- [[ project.nvim ]]
-- The superior project management solution for neovim
-- https://github.com/ahmedkhalf/project.nvim

require("project_nvim").setup({})

require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
})

require('telescope').load_extension('projects')
require'telescope'.extensions.projects.projects{}
