-- [[ diffview.nvim ]]
-- Single tabpage interface for easily cycling through diffs
-- https://github.com/sindrets/diffview.nvim

return {
  "sindrets/diffview.nvim",
  lazy = true,
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diff view" },
    { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", "File history" },
  },
}
