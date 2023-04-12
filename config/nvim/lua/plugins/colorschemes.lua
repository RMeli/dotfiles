return {
	-- [[ github-theme ]]
	-- Github's Neovim themes
	-- https://github.com/projekt0n/github-nvim-theme
	{
		"projekt0n/github-nvim-theme",
		version = "v0.0.7",
		lazy = false,
		priority = 100,
		opts = { style = "github_dark" },
		config = function()
			require("github-theme").setup()
		end,
	},
	-- [[ catpuccin ]]
	-- Soothing pastel theme for (Neo)vim
	-- https://github.com/catppuccin/nvim
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
	},
	-- [[ lunarvim/colorschemes ]]
	-- Collection of colorschemes made to be compatible with LunarVim
	-- https://github.com/LunarVim/Colorschemes
	{
		"lunarvim/colorschemes",
		lazy = true,
		priority = 100,
	},
	-- [[ tokyonight ]]
	-- A clean, dark Neovim theme written in Lua
	-- https://github.com/folke/tokyonight.nvim
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 100,
		opts = { style = "moon" },
	},
}
