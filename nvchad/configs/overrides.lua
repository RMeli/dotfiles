local M = {}

M.treesitter = {
	ensure_installed = {
		-- defaults
		"vim",
		"lua",

		"json",
		"yaml",
		"toml",

		"c",
		"cpp",
		"fortran",
		"python",
		"cuda",

		"cmake",
		"make",

		"bash",

		"diff",
		"regex",

		"latex",
		"markdown",
		"markdown_inline",

		"dockerfile",
		"doxygen",

		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		"lua-language-server",
		"stylua",

		"clangd",
		"clang-format",
		"fortls",
		"pyright",

		"cmake-language-server",
		"ltex-ls",
		"bash-language-server",
		"shellcheck",
		"cmakelint",

		"yaml-language-server",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.gitsigns = {
	-- Manually configure signs and add line number highlighting
	signs = {
		add = {
			hl = "GitSignsAdd",
			text = "",
			numhl = "GitSignsAddNr",
			linehl = "GitSignsAddLn",
		},
		change = {
			hl = "GitSignsChange",
			text = "󱍸",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
		delete = {
			hl = "GitSignsDelete",
			text = "",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		-- First line of file deleted
		topdelete = {
			hl = "GitSignsDelete",
			text = "",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		-- Modified lines occupying same space as deleted lines
		changedelete = {
			hl = "GitSignsChange",
			text = "󰀨",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
		untracked = {
			hl = "", -- No highlight, symbol is blank
			text = "",
			numhl = "GitSignsAddNr",
			linehl = "GitSignsAddLn",
		},
	},
	numhl = true, -- Highlight numbers
	linehl = false, -- Highlight lines
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 500,
		ignore_whitespace = true,
	},
}

return M
