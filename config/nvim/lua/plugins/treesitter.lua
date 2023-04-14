-- [[ nvim-treesitter ]]
-- Nvim Treesitter configurations and abstraction layer
-- https://github.com/nvim-treesitter/nvim-treesitter

return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			init = function()
				local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
				local opts = require("lazy.core.plugin").values(plugin, "opts", false)
				local enabled = false
				if opts.textobjects then
					for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
						if opts.textobjects[mod] and opts.textobjects[mod].enable then
							enabled = true
							break
						end
					end
				end
				if not enabled then
					require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
				end
			end,
		},
	},
	opts = {
		ensure_installed = {
			"bash",
			"bibtex",
			"c",
			"cmake",
			"cpp",
			"cuda",
			"diff",
			"dockerfile",
			"fortran",
			"gitconfig",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"json",
			"json5",
			"julia",
			"latex",
			"lua",
			"make",
			"markdown",
			"python",
			"toml",
			"vim",
			"yaml",
		},
		auto_install = true, -- automatically install missing parsers
		highlight = {
			enable = true,
			disable = { "" },
			additional_vim_regex_highlighting = false,
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = { "" } },
		context_commentstring = { enable = true, enable_autocmd = false },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj
				keymaps = {
					["af"] = { query = "@function.outer", desc = "Select Function (All)" },
					["if"] = {
						query = "@function.inner",
						desc = "Select Function (Inside)",
					},
					["ac"] = { query = "@class.outer", desc = "Select Class (All)" },
					["ic"] = { query = "@class.inner", desc = "Select Class (Inside)" },
				},
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					["@class.outer"] = "<c-v>", -- blockwise
				},
				include_surrounding_whitespace = false,
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = { query = "@function.outer", desc = "Next Function Start" },
					["]]"] = { query = "@class.outer", desc = "Next Class Start" },
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
