return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				component_separators = { left = "|", right = "" },
				section_separators = " ",
				disabled_filetypes = {
					"help",
					"startuptime",
					"qf",
					"lspinfo",
					"checkhealth",
					"man",
				},
				ignore_focus = {
					"NvimTree",
				},
			},
			extensions = {
				"nvim-tree",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{
						"filename",
						newfile_status = false,
						symbols = {
							modified = "●",
						},
					},
				},
				lualine_c = { "branch", "diff", "diagnostics" },
				lualine_x = { "" },
				lualine_y = { "searchcount" },
				lualine_z = { "progress" },
			},
		})
	end,
}
