-- [[ hop.nvim ]]
-- Neovim motions on speed!
-- https://github.com/phaazon/hop.nvim

local ok, hop = REQUIRE_PLUGIN("hop")
if not ok then
  return
end

hop.setup()

local wk = require("which-key")

wk.register({
  ["<leader>h"] = { name = "+hop" },
  ["<leader>hw"] = { "<cmd>HopWord<cr>", "Hop to word" },
  ["<leader>hc"] = { "<cmd>HopChar1<cr>", "Hop to char" },
  ["<leader>hl"] = { "<cmd>HopLine<cr>", "Hop to line" },
  ["<leader>hs"] = { "<cmd>HopLineStart<cr>", "Hop to line start" },
  ["<leader>ha"] = { "<cmd>HopAnywhere<cr>", "Hop anywhere" },
})
