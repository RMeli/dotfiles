-- [[ hop.nvim ]]
-- Neovim motions on speed!
-- https://github.com/phaazon/hop.nvim

return {
  "phaazon/hop.nvim",
  lazy = false,
  keys = {
    { "<leader>hw", "<cmd>HopWord<cr>", desc = "Hop to word" },
    { "<leader>hc", "<cmd>HopChar1<cr>", desc = "Hop to char" },
    { "<leader>hl", "<cmd>HopLine<cr>", desc = "Hop to line" },
    { "<leader>hs", "<cmd>HopLineStart<cr>", desc = "Hop to line start" },
    { "<leader>ha", "<cmd>HopAnywhere<cr>", desc = "Hop anywhere" },
  },
}
