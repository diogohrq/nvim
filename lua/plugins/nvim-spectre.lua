return {
	"nvim-pack/nvim-spectre",
	build = false,
	config = function()
		require("spectre").setup({
			vim.keymap.set("n", "<leader>sr", ":Spectre<CR>", { desc = "Open NVIM-SPECTRE interface" }),
		})
	end,
}
