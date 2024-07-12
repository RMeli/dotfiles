-- [[ hop.nvim ]]
-- Neovim motions on speed!
-- https://github.com/phaazon/hop.nvim

local ok, hop = REQUIRE_PLUGIN("hop")
if not ok then
  return
end

hop.setup()

local wk = require("which-key")

wk.add({
  { "<leader>h",  group = "hop" },
  { "<leader>ha", "<cmd>HopAnywhere<cr>",  desc = "Hop anywhere" },
  { "<leader>hc", "<cmd>HopChar1<cr>",     desc = "Hop to char" },
  { "<leader>hl", "<cmd>HopLine<cr>",      desc = "Hop to line" },
  { "<leader>hs", "<cmd>HopLineStart<cr>", desc = "Hop to line start" },
  { "<leader>hw", "<cmd>HopWord<cr>",      desc = "Hop to word" },
})
