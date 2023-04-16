-- [[ diffview.nvim ]]
-- Single tabpage interface for easily cycling through diffs
-- https://github.com/sindrets/diffview.nvim

return {
  "sindrets/diffview.nvim",
  lazy = false, -- TODO: Make lazy
  keys = {
    "<leader>gd",
    "<leader>gq",
    "<leader>gh",
  },
}
