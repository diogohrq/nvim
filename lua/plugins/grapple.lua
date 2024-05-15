return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	opts = {
		scope = "git", -- also try out "git_branch"
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{ "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
		{ "<leader>M", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
		{ "<c-h>", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
		{ "<c-t>", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
		{ "<c-n>", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
		{ "<c-s>", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
		{ "<leader>h", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
		{ "<leader>l", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
	},
}
