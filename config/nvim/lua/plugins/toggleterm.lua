-- [[ toggleterm ]]
-- A neovim lua plugin to help easily manage multiple terminal windows
-- https://github.com/akinsho/toggleterm.nvim

-- [[ terminals ]]
-- Define terminals that open with a command

local term = require("toggleterm.terminal").Terminal

-- TODO: Check if executables exist!
local lazygit = term:new({ cmd = "lazygit", hidden = true })
local htop = term:new({ cmd = "htop", hidden = true })

-- Define global functions
-- Can be called with "<cmd>lua FUNCTION<cr>"
function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

function _HTOP_TOGGLE()
  htop:toggle()
end

return {
  "akinsho/toggleterm.nvim",
  lazy = false,
  opts = {
    open_mapping = [[<c-\>]],
    insert_mapping = true, -- Open mapping also works in insert mode
    on_open = function()
      vim.cmd("wa") -- Save all buffers when opening a terminal
    end,
    direction = "float",
    float_opts = {
      border = "curved",
    },
  },
  keys = {
    { "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", desc = "Open LazyGit Terminal" },
    { "<leader>th", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Open HTop Terminal" },
  },
}
