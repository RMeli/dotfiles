-- [[ diffview.nvim ]]
-- Single tabpage interface for easily cycling through diffs
-- https://github.com/sindrets/diffview.nvim

return {
  "sindrets/diffview.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = true,
}
