-- [[ alpha-nvim ]]
-- A lua powered greeter like vim-startify/dashboard-nvim
-- https://github.com/goolord/alpha-nvim

local ok, dashboard = REQUIRE_PLUGIN("alpha.themes.dashboard")
if not ok then
  return
end

dashboard.section.buttons.val = {
  dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
  dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "󰊄  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
  dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
}

require("alpha").setup(dashboard.opts)
