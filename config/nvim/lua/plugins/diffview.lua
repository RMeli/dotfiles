-- [[ diffview.nvim ]]
-- Single tabpage interface for easily cycling through diffs
-- https://github.com/sindrets/diffview.nvim

local ok, diffview = REQUIRE_PLUGIN("diffview")
if not ok then
  return
end

diffview.setup({})
