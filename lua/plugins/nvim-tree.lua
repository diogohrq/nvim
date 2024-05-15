return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			view = {
				adaptive_size = true,
				signcolumn = "no",
				number = false,
				relativenumber = false,
			},
			renderer = {
				root_folder_label = false,
				add_trailing = true,
				indent_markers = {
					enable = true,
					icons = {
						corner = "└ ",
						edge = "│ ",
						item = "│ ",
						none = "  ",
					},
				},
				icons = {
					webdev_colors = true,
					show = {
						file = true,
						folder = true,
						folder_arrow = false,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "", -- 
							staged = "",
							unmerged = "",
							renamed = "➜",
							untracked = "",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				icons = {
					hint = "󰌵",
					info = "",
					warning = "!",
					error = "",
				},
			},
		})

		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
		-- vim.keymap.set("n", "<leader>", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })
	end,
}
