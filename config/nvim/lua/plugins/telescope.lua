-- [[ telecsope.nvim ]]
-- Find, Filter, Preview, Pick. All lua, all the time.
-- https://github.com/nvim-telescope/telescope.nvim

require("telescope").setup({})

-- [[ keymaps ]]

local wk = require("which-key")
local tb = require("telescope.builtin")

wk.register({
  ["<leader>f"] = { name = "+file" },
  ["<leader>ff"] = { tb.find_files, "Find File" },
  ["<leader>fr"] = { tb.oldfiles, "Open Recent File" },
  ["<leader>fg"] = { tb.live_grep, "Grep Files" },
  ["<leader>fb"] = { tb.buffers, "Open Recent Buffer" },
  ["<leader>fs"] = { tb.find_string, "Search Current String" },
  ["<leader>fh"] = { tb.help_tags, "Help" },
  ["<leader>ft"] = { tb.treesitter, "Show Code Tree" },
})

