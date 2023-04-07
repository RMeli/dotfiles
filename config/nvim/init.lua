-- -------------- --
-- [[ init.lua ]] --
-- -------------- --

vim.g.mapleader = ","
vim.g.localleader = "\\"

-- disable netrw
-- advised by [[ nvim-tree]]
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- require files in ./lua/ folder
require("utils")
require("vars")
require("setup")
require("keymaps")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy.nvim plugin manager
require("lazy").setup("plugins")

--require("plugins.lsp.keymaps")
-- require("plugins")
