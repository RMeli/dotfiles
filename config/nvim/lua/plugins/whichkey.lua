-- [[ which-key.nvim ]]
-- Create key bindings that stick
-- https://github.com/folke/which-key.nvim
return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- plugins = { spelling = true },
			window = {
				border = "single",
				position = "bottom",
			},
			icons = {
				breadcrumb = "",
				separator = "ﭠ",
				group = "",
			},
			disable = {
				buftypes = {},
				filetypes = { "TelescopePrompt", "alpha" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			local keymaps = {
				mode = { "n", "v" },
				--        ["g"] = { name = "+goto" },
				--        ["gz"] = { name = "+surround" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
				--        ["<leader><tab>"] = { name = "+tabs" },
				["<leader>b"] = { name = "+buffer" },
				["<leader>c"] = { name = "+code" },
				["<leader>f"] = { name = "+file" },
				["<leader>g"] = { name = "+git" },
				["<leader>h"] = { name = "+hop" },
				["<leader>l"] = { name = "+lsp" },
				["<leader>q"] = { name = "+session" },
				["<leader>s"] = { name = "+search" },
				["<leader>t"] = { name = "+term" },
				["<leader>u"] = { name = "+ui" },
			}
			wk.register(keymaps)
		end,
	},
}
