-- [[ persistence.nvim ]]
-- Simple session management for Neovim
-- https://github.com/folke/persistence.nvim

require("persistence").setup()

local ok, persistence = REQUIRE_PLUGIN("persistence")

if not ok then
  return
end

persistence.setup()

-- [[ keymaps ]]

local wk = require("which-key")

wk.register({
  ["<leader>q"] = { name = "+session" },
  ["<leader>qs"] = { [[<cmd>lua require("persistence").load()<cr>]], "Load Session" },
  ["<leader>ql"] = { [[<cmd>lua require("persistence").load({ last = true })<cr>]], "Load Last Session" },
  ["<leader>qd"] = { [[<cmd>lua require("persistence").stop()<cr>]], "Do Not Save Current Session" },
})
