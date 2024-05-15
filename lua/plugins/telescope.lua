return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"^./.git/",
					"^node_modules/",
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to previous result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find string in cwd" })
		vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
		vim.keymap.set(
			"n",
			"<leader>fb",
			"<cmd>lua require('telescope.builtin').buffers({ ignore_current_buffer = true})<CR>"
		)
	end,
}
