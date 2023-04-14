-- [[ telecsope.nvim ]]
-- Find, Filter, Preview, Pick. All lua, all the time.
-- https://github.com/nvim-telescope/telescope.nvim

return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  cmd = "Telescope",
  dependencies = { "ahmedkhalf/project.nvim", "rcarriga/nvim-notify" },
  opts = {
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
  },
  config = function()
    --      local telescope = require("telescope")
    --      local tb = require("telescope.builtin")
    --      local telescope_extensions = { "project", "notify" }
    --      for _, extension in ipairs(telescope_extensions) do
    --         telescope.load_extension(extension)
    --      end
  end,
  keys = {
    --      { "<leader>fb", tb.buffers, desc = "Buffers" },
    --      { "<leader>ff", tb.find_files, desc = "Files" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
    -- git
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
    -- LSP
    --      { "<leader>lc", tb.find_outgoing_calls, "Outgoing Calls" },
    --      { "<leader>lC", tb.find_incoming_calls, "Incoming Calls" },
    --      { "<leader>ld", tb.lsp_definitions, "Definitions" },
    --      { "<leader>lD", tb.diagnostics, "Diagnostics" },
    --      { "<leader>li", tb.lsp_implementations, "Implementation" },
    --     { "<leader>lr", tb.references, "References" },
    --      { "<leader>lr", tb.lsp_document_symbols, "Symbols" },
    -- search
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current Buffer" },
    { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Highlight Groups" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    --      { "<leader>sn", telescope.extensions.notify.notify, desc = "Notify" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    --      { "<leader>sw", tb.grep_string, desc = "Word" },
    --      { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
  },
}
