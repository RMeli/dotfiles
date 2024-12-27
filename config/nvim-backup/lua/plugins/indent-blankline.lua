-- [[ indent-blankline ]]
-- Indent guides for Neovim
-- https://github.com/lukas-reineke/indent-blankline.nvim

local ok, ibl = REQUIRE_PLUGIN("ibl")
if not ok then
  return
end

ibl.setup()
