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

wk.add({
  { "<leader>f", group = "find" },
  { "<leader>ff", tb.find_files, desc = "Find File" },
  { "<leader>fo", tb.oldfiles, desc = "Open Recent File" },
  { "<leader>fg", tb.live_grep, desc = "Grep Files" },
  { "<leader>fb", tb.buffers, desc = "Open Recent Buffer" },
  { "<leader>fs", tb.grep_string, desc = "Search Current String" },
  { "<leader>fn", telescope.extensions.notify.notify, desc = "Notify" },
  { "<leader>f?", tb.help_tags, desc = "Help" },
  -- Treesitter pickers
  { "<leader>fct", tb.treesitter, desc = "Show Code Tree" },
  -- LSP
  -- See also lsp/keymaps.lua
  { "<leader>fi", tb.lsp_implementations, desc = "Find Implementation" },
  { "<leader>fd", tb.lsp_definitions, desc = "Find Definitions" },
  { "<leader>fr", tb.lsp_references, desc = "Find References" },
  { "<leader>fc", tb.lsp_outgoing_calls, desc = "Find Outgoing Calls" },
  { "<leader>fC", tb.find_incoming_calls, desc = "Find Incoming Calls" },
  { "<leader>fl", tb.diagnostics, desc = "Diagnostic Float Window" },
})
