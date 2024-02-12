return {
  "akinsho/toggleterm.nvim",
  config = function ()
    require("toggleterm").setup{
      size = 15,
      open_mapping = [[<c-/>]],
      hide_numbers = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = true,
      direction = "horizontal",
    }
  end
}
