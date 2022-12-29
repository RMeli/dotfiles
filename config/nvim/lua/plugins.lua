-- ----------------- --
-- [[ plugins.lua ]] --
-- ----------------- --

return require("packer").startup(function(use)
  -- [[ nvim-tree ]]
  -- A file explorer tree for neovim written in lua
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons", -- filesystem icons
    tag = "nightly",
  })

  -- [[ nvim-treesitter ]]
  -- Nvim Treesitter configurations and abstraction layer
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local tsupdate = require("nvim-treesitter.install").update({ with_sync = true })
      tsupdate()
    end,
  })

  -- [[ github-nvim-theme ]]
  -- Github's Neovim themes
  use({ "projekt0n/github-nvim-theme" })

  -- [[ lualine.nvim ]]
  -- A blazing fast and easy to configure neovim statusline written in pure lua
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- [[ telescope.nvim ]]
  -- Find, Filter, Preview, Pick. All lua, all the time
  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = { { "nvim-lua/plenary.nvim" } },
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
    tag = "*",
  })

  -- [[ bufferline.nvim ]]
  -- A snazzy bufferline for Neovim
  use({
    "akinsho/bufferline.nvim",
    tag = "v3.*",
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
  })

  use({
    "rcarriga/nvim-notify",
  })

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

  -- [[ vim-vsnip ]]
  -- Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format
  use({
    "hrsh7th/cmp-vsnip",
    requires = { "hrsh7th/nvim-cmp", "hrsh7th/vim-vsnip" },
  })

  -- [[ null-ls ]]
  -- Use Neovim as a LS to inject LSP diagnostics, code actions, and more via Lua
  use({ "jose-elias-alvarez/null-ls.nvim" })
  -- --- --
  -- LSP --
  -- --- --
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  })
end)
