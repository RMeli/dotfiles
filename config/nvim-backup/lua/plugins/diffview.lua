-- [[ diffview.nvim ]]
-- Single tabpage interface for easily cycling through diffs
-- https://github.com/sindrets/diffview.nvim

local ok, diffview = REQUIRE_PLUGIN("diffview")
if not ok then
  return
end

diffview.setup({})

local wk = require("which-key")

wk.add({
  { "<leader>g", group = "git" },
  { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diff view" },
  { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "File history" },
  { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
})
