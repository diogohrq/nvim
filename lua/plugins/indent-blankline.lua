return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		local ibl = require("ibl")

		ibl.setup({
			indent = {
				char = "▏",
				tab_char = "▏",
			},
			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
			},
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		})
	end,
}
