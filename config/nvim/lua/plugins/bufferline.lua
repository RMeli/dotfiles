-- [[ bufferline.nvim ]]
-- A snazzy bufferline for Neovim
-- https://github.com/akinsho/bufferline.nvim

local ok, bufferline = pcall(require, "bufferline")
if not ok then
  return
end

bufferline.setup({
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none",
    indicator = {
      icon = "▎",
      style = "icon",
    },
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    max_name_length = 25,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = ""
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and "" or (e == "warning" and "" or "")
        s = s .. n .. sym .. " "
      end
      return s
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = false,
      },
    },
    color_icons = true,
    show_buffer_icons = true, -- filetype icons for buffers
    show_buffer_close_icons = true,
    show_buffer_default_icon = false, --  unrecognised filetype
    show_close_icon = true,
    show_tab_indicators = true,
  },
})
