-- [[ toggleterm ]]
-- A neovim lua plugin to help easily manage multiple terminal windows
-- https://github.com/akinsho/toggleterm.nvim

-- [[ terminals ]]

return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
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
  config = function()
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
  end,
}
