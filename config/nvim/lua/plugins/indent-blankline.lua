-- [[ indent-blankline ]]
-- Indent guides for Neovim
-- https://github.com/lukas-reineke/indent-blankline.nvim

return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		show_end_of_line = true,
		space_char_blankline = " ",
		show_current_context_start = true,
		filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
	},
}
