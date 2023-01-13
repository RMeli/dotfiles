-- [[ telecsope.nvim ]]
-- Find, Filter, Preview, Pick. All lua, all the time.
-- https://github.com/nvim-telescope/telescope.nvim

local ok, telescope = REQUIRE_PLUGIN("telescope")
if not ok then
  return
end

local telescope_extensions = { "project", "notify" }

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
  },
  -- Find out available pickers with <cmd>Telescope<tab>
  pickers = {
    lsp_references = {
      -- theme = "cursor",
    },
  },
})

-- [[ extensions ]]

for _, extension in ipairs(telescope_extensions) do
  telescope.load_extension(extension)
end

-- [[ keymaps ]]

local wk = require("which-key")
local tb = require("telescope.builtin")

wk.register({
  ["<leader>f"] = { name = "+find" },
  ["<leader>ff"] = { tb.find_files, "Find File" },
  ["<leader>fo"] = { tb.oldfiles, "Open Recent File" },
  ["<leader>fg"] = { tb.live_grep, "Grep Files" },
  ["<leader>fb"] = { tb.buffers, "Open Recent Buffer" },
  ["<leader>fs"] = { tb.grep_string, "Search Current String" },
  ["<leader>fn"] = { telescope.extensions.notify.notify, "Notify" },
  ["<leader>f?"] = { tb.help_tags, "Help" },
  -- Treesitter pickers
  ["<leader>fct"] = { tb.treesitter, "Show Code Tree" },
  -- LSP
  -- See also lsp/keymaps.lua
  ["<leader>fi"] = { tb.lsp_implementations, "Find Implementation" },
  ["<leader>fd"] = { tb.lsp_definitions, "Find Definitions" },
  ["<leader>fr"] = { tb.lsp_references, "Find References" },
  ["<leader>fc"] = { tb.lsp_outgoing_calls, "Find Outgoing Calls" },
  ["<leader>fC"] = { tb.find_incoming_calls, "Find Incoming Calls" },
  ["<leader>fl"] = { tb.diagnostics, "Diagnostic Float Window" },
})
