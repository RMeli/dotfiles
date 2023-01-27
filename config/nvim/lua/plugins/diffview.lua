-- [[ diffview.nvim ]]
-- Single tabpage interface for easily cycling through diffs
-- https://github.com/sindrets/diffview.nvim

local ok, diffview = REQUIRE_PLUGIN("diffview")
if not ok then
  return
end

diffview.setup({})

local wk = require("which-key")

wk.register({
  ["<leader>g"] = { name = "+git" },
  ["<leader>gd"] = { "<cmd>DiffviewOpen<cr>", "Open diff view" },
  ["<leader>gq"] = { "<cmd>DiffviewClose<cr>", "Close diff view" },
  ["<leader>gh"] = { "<cmd>DiffviewFileHistory<cr>", "File history" },
})
