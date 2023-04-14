-- [[ telecsope.nvim ]]
-- Find, Filter, Preview, Pick. All lua, all the time.
-- https://github.com/nvim-telescope/telescope.nvim

return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  cmd = "Telescope",
  dependencies = { "ahmedkhalf/project.nvim", "rcarriga/nvim-notify" },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "smart" },
    },
    -- Find out available pickers with <cmd>Telescope<tab>
    pickers = {
      lsp_references = {
        -- theme = "cursor",
      },
    },
  },
  config = function()
    local telescope = require("telescope")
    local tb = require("telescope.builtin")
    --      local telescope_extensions = { "project", "notify" }
    --      for _, extension in ipairs(telescope_extensions) do
    --         telescope.load_extension(extension)
    --      end
  end,
}
