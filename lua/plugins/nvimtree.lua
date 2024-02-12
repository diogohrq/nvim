return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup()

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true

		vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", {})
		vim.keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", {})
	end,
}
