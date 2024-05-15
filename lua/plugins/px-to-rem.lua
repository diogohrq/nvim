return {
	"jsongerber/nvim-px-to-rem",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-px-to-rem").setup({
			add_cmp_source = false,
		})
	end,
}
