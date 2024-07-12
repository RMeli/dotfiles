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

wk.add({
  {
    { "<leader>q", group = "Session" },
    { "<leader>qd", '<cmd>lua require("persistence").stop()<cr>', desc = "Do Not Save Current Session" },
    { "<leader>ql", '<cmd>lua require("persistence").load({ last = true })<cr>', desc = "Load Last Session" },
    { "<leader>qs", '<cmd>lua require("persistence").load()<cr>', desc = "Load Session" },
  }
})
