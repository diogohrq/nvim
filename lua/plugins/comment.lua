return {
	"numToStr/Comment.nvim",
	name = "comment",
	event = "VeryLazy",
	config = function()
		require("Comment").setup()
	end,
}
