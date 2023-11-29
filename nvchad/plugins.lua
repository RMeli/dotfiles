local overrides = require("custom.configs.overrides")

local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = overrides.gitsigns,
	},

	-- install plugins
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"folke/todo-comments.nvim",
		signs = true, -- show icons in the signs column
    event = "BufEnter",
		opts = {
			keywords = {
				FIX = {
					icon = " ",
					color = "error",
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
				},
				TODO = { icon = "", color = "info" },
				HACK = { icon = "", color = "warning" },
				WARN = { icon = "", color = "warning", alt = { "WARNING" } },
				PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = "", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			gui_style = {
				fg = "NONE",
				bg = "BOLD",
			},
			pattern = [[\b(KEYWORDS):]],
		},
	},
}

return plugins
