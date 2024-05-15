return {
	"VonHeikemen/lsp-zero.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "neovim/nvim-lspconfig" },
		{ "L3MON4D3/LuaSnip" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(client, bufnr)
			-- keybindings are listed here:
			-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/api-reference.md#default_keymapsopts
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		-- technically these are "diagnostic signs"
		-- neovim enables them by default.
		-- here we are just changing them to fancy icons.
		lsp_zero.set_sign_icons({
			error = "",
			warn = "",
			hint = "󰌵",
			info = "",
		})

		-- to learn how to use mason.nvim
		-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
		require("mason").setup({})
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				-- cssls = function()
				-- 	require("lspconfig").cssls.setup({
				-- 		filetypes = { "css" },
				-- 	})
				-- end,
				-- emmet_ls = function()
				-- 	require("lspconfig").emmet_ls.setup({
				-- 		filetypes = { "html" },
				-- 	})
				-- end,
				lua_ls = function()
					local lua_opts = lsp_zero.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
				-- eslint = function()
				-- 	require("lspconfig").eslint.setup({
				-- 		filetypes = { "javascript" },
				-- 	})
				-- end,
			},
		})

		local cmp = require("cmp")
		local cmp_action = lsp_zero.cmp_action()

		-- this is the function that loads the extra snippets
		-- from rafamadriz/friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "buffer", keyword_length = 3 },
			},
			-- window = {
			-- 	completion = cmp.config.window.bordered(),
			-- 	documentation = cmp.config.window.bordered(),
			-- },
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				-- confirm completion item
				["<CR>"] = cmp.mapping.confirm({ select = true }),

				-- trigger completion menu
				["<C-Space>"] = cmp.mapping.complete(),

				-- scroll up and down the documentation window
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),

				-- navigate between snippet placeholders
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<Tab>"] = cmp.mapping.select_next_item(),
			}),
			-- note: if you are going to use lsp-kind (another plugin)
			-- replace the line below with the function from lsp-kind
			formatting = lsp_zero.cmp_format({ details = true }),
		})
	end,
}
