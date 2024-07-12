-- [[ colorschemes ]]
local colorscheme = "github_dark_dimmed"

-- Load GitHub theme
local ght_ok, ght = REQUIRE_PLUGIN("github_theme")
if ght_ok then
  ght.setup()
end

-- Load Tokyonight theme
local tnt_ok, tnt = REQUIRE_PLUGIN("tokyonight")
if tnt_ok then
  tnt.setup()
end

-- Select default color sceheme
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme) -- Protected call
if not ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end
