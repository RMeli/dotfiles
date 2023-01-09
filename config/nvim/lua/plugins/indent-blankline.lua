-- [[ indent-blankline ]]
-- Indent guides for Neovim
-- https://github.com/lukas-reineke/indent-blankline.nvim

local ok, ibl = REQUIRE_PLUGIN("indent_blankline")
if not ok then
  return
end

ibl.setup({
  show_end_of_line = true,
  space_char_blankline = " ",
  show_current_context_start = true,
})
