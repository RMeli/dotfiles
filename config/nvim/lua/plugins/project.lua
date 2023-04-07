-- [[ project.nvim ]]
-- The superior project management solution for neovim
-- https://github.com/ahmedkhalf/project.nvim

local ok, project = REQUIRE_PLUGIN("project_nvim")
if not ok then
  return
end

return {
  "ahmedkhalf/project.nvim",
  lazy = false,
  keys = {
    { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Find Project" },
  },
  init = function()
    local telescope_ok, telescope = pcall(require, "telescope")
    if telescope_ok then
      telescope.load_extension("projects")
    end
  end,
}
