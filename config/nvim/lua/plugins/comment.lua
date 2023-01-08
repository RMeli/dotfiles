-- [[ Comment.nvim ]]
-- Smart and powerful comment plugin for neovim.
-- https://github.com/numToStr/Comment.nvim

local ok, comment = REQUIRE_PLUGIN("Comment")
if not ok then
  return
end

comment.setup()
