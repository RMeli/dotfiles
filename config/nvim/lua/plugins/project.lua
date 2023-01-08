-- [[ project.nvim ]]
-- The superior project management solution for neovim
-- https://github.com/ahmedkhalf/project.nvim

local ok, project = pcall(require, "project_nvim")
if not ok then
  return
end

project.setup({})

-- [[ telescope ]]

local ok, telescope = pcall(require, "telescope")
if ok then
  require("telescope").load_extension("projects")

  local wk = require("which-key")
  wk.register({
    ["<leader>f"] = { name = "+file" },
    ["<leader>fp"] = { "<cmd>Telescope projects<cr>", "Find Project" },
  })
end
