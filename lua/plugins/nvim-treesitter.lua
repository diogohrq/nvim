return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	-- event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local config = require("nvim-treesitter.configs")
		local context = require("treesitter-context")

		config.setup({
			auto_install = true,
			highlight = {
				enable = true,
				aditional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = { enable = true },
			rainbow = { enable = true },
			fold = {
				enable = true,
				disable = {},
			},
		})

		context.setup({
			multiline_threshold = 4,
		})
	end,
}
