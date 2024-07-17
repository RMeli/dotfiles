-- ------------- --
-- [[ plugins ]] --
-- ------------- --

-- Reloads NeoVim whenever plugins.lua is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use protected call to abort
local ok, packer = pcall(require, "packer")
if not ok then
  vim.notify("require('packer') failed!", "error")
  return
end

packer.init({
  max_jobs = 4,
  --  Use packer within pop-up window (as opposed to split view)
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Packer manages itself

  use("lewis6991/impatient.nvim")

  -- [[ nvim-tree ]]
  -- A file explorer tree for neovim written in lua
  use({
    "nvim-tree/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons", -- filesystem icons
  })

  -- [[ nvim-treesitter ]]
  -- Nvim Treesitter configurations and abstraction layer
  use({
    "nvim-treesitter/nvim-treesitter",
    require = "nvim-treesitter/nvim-treesitter-textobjects",
    run = function()
      local tsupdate = require("nvim-treesitter.install").update({ with_sync = true })
      tsupdate()
    end,
  })

  -- [[ github-nvim-theme ]]
  -- Github's Neovim themes
  --use({ "projekt0n/github-nvim-theme" })
  use({ "projekt0n/github-nvim-theme" })

  -- [[ colorschemes ]]
  -- Collection of colorschemes made to be compatible with LunarVim
  -- https://github.com/LunarVim/Colorschemes
  use("lunarvim/colorschemes")

  -- [[ tokyonight.nvim ]]
  -- A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins
  -- https://github.com/folke/tokyonight.nvim
  use("folke/tokyonight.nvim")

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- [[ vim-sleuth ]]
  -- Heuristically set buffer options
  use({ "tpope/vim-sleuth" })

  -- [[ telescope.nvim ]]
  -- Find, Filter, Preview, Pick. All lua, all the time
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-project.nvim" } },
  })

  -- [[ vim-illuminate ]]
  -- (Neo)Vim plugin for automatically highlighting other uses of the word under the cursor
  use({ "RRethy/vim-illuminate" })

  -- [[ indent-blankline.nvim ]]
  -- Indent guides for Neovim
  use({ "lukas-reineke/indent-blankline.nvim" })

  -- [[ toggleterm.nvim ]]
  -- A neovim lua plugin to help easily manage multiple terminal windows
  use({
    "akinsho/toggleterm.nvim",
  })

  -- [[ bufferline.nvim ]]
  -- A snazzy bufferline for Neovim
  use({
    "akinsho/bufferline.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  })

  -- [[ Comment.nvim ]]
  -- Smart and powerful comment plugin for neovim
  use({
    "numToStr/Comment.nvim",
  })

  -- [[ alpha-nvim ]]
  use({
    "goolord/alpha-nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  -- [[ gitsigns.nvim ]]
  -- Git integration for buffers
  use({
    "lewis6991/gitsigns.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  -- [[ diffview.nvim ]]
  -- Single tabpage interface for easily cycling through diffs
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

  use({
    "rcarriga/nvim-notify",
  })

  -- [[ hop.nvim ]]
  -- Neovim motions on speed!
  use({
    "phaazon/hop.nvim",
  })

  -- [[ nvim-autopairs ]]
  -- autopairs for neovim written by lua
  -- https://github.com/windwp/nvim-autopairs
  use("windwp/nvim-autopairs")

  -- [[ nvim-cmp ]]
  -- A completion plugin for neovim coded in Lua
  use({ "hrsh7th/nvim-cmp" })

  -- [[ cmp-nvim-lsp ]]
  -- nvim-cmp source for neovim builtin LSP client
  use({
    "hrsh7th/cmp-nvim-lsp",
    requires = { "hrsh7th/nvim-cmp" },
  })

  use({
    "hrsh7th/cmp-buffer",
    requires = { "hrsh7th/nvim-cmp" },
  })

  use({
    "hrsh7th/cmp-path",
    requires = { "hrsh7th/nvim-cmp" },
  })

  use({
    "hrsh7th/cmp-cmdline",
    requires = { "hrsh7th/nvim-cmp" },
  })

  use({
    "hrsh7th/cmp-nvim-lua",
    requires = { "hrsh7th/nvim-cmp" },
  })

  -- Simple session management for NeoVim
  use({
    "folke/persistence.nvim",
  })

  -- Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format
  use({
    "hrsh7th/cmp-vsnip",
    requires = { "hrsh7th/nvim-cmp", "hrsh7th/vim-vsnip" },
  })

  use("folke/neodev.nvim")

  -- [[ null-ls ]]
  -- Use Neovim as a LS to inject LSP diagnostics, code actions, and more via Lua
  use({ "nvimtools/none-ls.nvim", requires = "nvimtools/none-ls-extras.nvim" })

  -- [[ which-key.nvim ]]
  use({
    "folke/which-key.nvim",
  })

  -- [[ todo-comments.nvim ]]
  -- Highlight, list and search todo comments in your projects
  -- https://github.com/folke/todo-comments.nvim
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  })

  -- [[ project.nvim ]]
  -- The superior project management solution for neovim
  use({
    "ahmedkhalf/project.nvim",
  })

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })
  
  use({"github/copilot.vim"})

  -- --- --
  -- LSP --
  -- --- --
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  })

end)
