-- [[ colorschemes ]]
local colorscheme = "github_dark"

require("github-theme").setup()
require("tokyonight").setup()

-- Select default color sceheme
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme) -- Protected call
if not ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end
