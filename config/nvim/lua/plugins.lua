-- ----------------- --
-- [[ plugins.lua ]] --
-- ----------------- --

return require('packer').startup(function(use)
    -- [[ nvim-tree ]]
    -- A file explorer tree for neovim written in lua
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',   -- filesystem icons
        tag = 'nightly'
    }

    -- [[ nvim-treesitter ]]
    -- Nvim Treesitter configurations and abstraction layer
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local tsupdate =
                require('nvim-treesitter.install').update({with_sync=true})
            tsupdate()
        end,
    }

    -- [[ github-nvim-theme ]]
    -- Github's Neovim themes
    use ({'projekt0n/github-nvim-theme'})

    -- [[ lualine.nvim ]]
    -- A blazing fast and easy to configure neovim statusline written in pure lua
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt=true}
    }

    -- [[ telescope.nvim ]]
    -- Find, Filter, Preview, Pick. All lua, all the time
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- [[ vim-illuminate ]]
    -- (Neo)Vim plugin for automatically highlighting other uses of the word under the cursor
    use {'RRethy/vim-illuminate'}

    -- [[ indent-blankline.nvim ]]
    -- Indent guides for Neovim
    use {'lukas-reineke/indent-blankline.nvim'}

    -- [[ toggleterm.nvim ]]
    -- A neovim lua plugin to help easily manage multiple terminal windows
    use {
        "akinsho/toggleterm.nvim",
        tag = '*'
    }

    -- [[ bufferline.nvim ]]
    -- A snazzy bufferline for Neovim
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }

    -- [[ Comment.nvim ]]
    -- Smart and powerful comment plugin for neovim
    use {
        'numToStr/Comment.nvim',
    }
end)

