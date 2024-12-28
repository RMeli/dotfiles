return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    tt = require 'toggleterm'
    tt.setup {
      open_mapping = [[<c-\>]],
      insert_mapping = true, -- Open mapping also works in insert mode
      on_open = function()
        vim.cmd 'wa' -- Save all buffers when opening a terminal
      end,
      on_close = function()
        vim.cmd 'bufdo! e' -- Reload all bbuffers when closing a terminal
      end,
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
    }

    -- [[ terminals ]]
    -- Define terminals that open with a command

    local term = require('toggleterm.terminal').Terminal

    -- TODO: Check if executables exist!
    local lazygit = term:new { cmd = 'lazygit', hidden = true }
    local htop = term:new { cmd = 'htop', hidden = true }

    -- Define global functions
    -- Can be called with "<cmd>lua FUNCTION<cr>"
    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    function _HTOP_TOGGLE()
      htop:toggle()
    end
  end,
  keys = {
    { '<leader>tg', '<cmd>lua _LAZYGIT_TOGGLE()<cr>', desc = 'Open LazyGit Terminal' },
    { '<leader>tt', '<cmd>lua _HTOP_TOGGLE()<cr>', desc = 'Open HTop Terminal' },
  },
}
