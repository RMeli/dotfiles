-- [[ toggleterm ]]
-- A neovim lua plugin to help easily manage multiple terminal windows
-- https://github.com/akinsho/toggleterm.nvim

local ok, tt = REQUIRE_PLUGIN("toggleterm")
if not ok then
  return
end

tt.setup({
  open_mapping = [[<c-\>]],
  insert_mapping = true, -- Open mapping also works in insert mode
  on_open = function()
    vim.cmd("wa") -- Save all buffers when opening a terminal
  end,
  on_close = function()
    vim.cmd("bufdo! e") -- Reload all bbuffers when closing a terminal
  end,
  direction = "float",
  float_opts = {
    border = "curved",
  },
})

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

-- [[ keymaps ]]
local wk = require("which-key")

wk.add({
  { "<leader>t", group = "term" },
  { "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", desc = "Open LazyGit Terminal" },
  { "<leader>th", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Open HTop Terminal" },
})
