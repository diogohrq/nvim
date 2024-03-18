return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leaderG", vim.cmd.UndotreeToggle, {})
	end,
}
